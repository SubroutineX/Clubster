import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:workflow/controllers/club_requests_controller.dart';
import 'package:workflow/controllers/interview_controller.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';
import 'package:workflow/views/widgets/buttonBuilder.dart';
import 'package:workflow/views/widgets/custom_expansion_tile.dart';

class ClubRequests extends StatefulWidget {
  final String clubId;

  ClubRequests({Key key, this.clubId}) : super(key: key);

  @override
  _ClubRequestsState createState() => _ClubRequestsState();
}

class _ClubRequestsState extends State<ClubRequests> {
  final clubRequestController = Get.put(ClubRequestsController());
  final interviewController = Get.put(InterviewController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    clubRequestController.fetchRequests(widget.clubId, "pending");
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();
  TextEditingController _time = new TextEditingController();
  TextEditingController des = new TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay pickedS = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (pickedS != null && pickedS != selectedTime)
      setState(() {
        selectedTime = pickedS;
        var ampm = selectedTime.hour > 12 ? "pm" : "am";
        var hours = (selectedTime.hour % 12).toString();
        String formatTime = hours + ":${selectedTime.minute} " + ampm;
        _time.value = TextEditingValue(text: formatTime);
      });
    print(selectedTime);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var date = DateTime.parse(picked.toString());
        String formatDate = "${date.day}/${date.month}/${date.year}";
        _date.value = TextEditingValue(text: formatDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: bw(),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: GetX<ClubRequestsController>(builder: (controller) {
          if (controller?.requests?.isNotEmpty ?? false)
            return ListView.builder(
              itemCount: controller.requests.length,
              itemBuilder: (context, i) {
                return CustomExpansionTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  elevation: 0,
                  title: Container(
                    height: 55,
                    child: Row(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                            child: Image.asset(
                              "assets/images/profile.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.requests.value[i].user,
                              style: textStyleGilroySB(
                                16,
                                colorFont(),
                              ),
                            ),
                            Text(
                              "Student",
                              style: textStyleGilroyM(
                                12,
                                colorFontLight(),
                              ),
                            ),
                          ],
                        ),
                        // Text(
                        //   controller.requests.value[i].timeStamp,
                        // )
                      ],
                    ),
                  ),
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description",
                              style: textStyleGilroySB(
                                14,
                                colorFont(),
                              ),
                            ),
                            Text(
                              controller.requests.value[i].description,
                              style: textStyleGilroyM(
                                12,
                                colorFontLight(),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Accept",
                                        style: textStyleGilroyM(
                                          14,
                                          white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: red,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Decline",
                                        style: textStyleGilroyM(
                                          14,
                                          white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () => showDialog1(
                                    controller.requests.value[i].user,
                                    widget.clubId,
                                    controller.requests.value[i].id,
                                  ),
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: neonBlue,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Interview",
                                        style: textStyleGilroyM(
                                          14,
                                          white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          else
            return Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/empty.png",
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "No requests yet!",
                      style: textStyleGilroySB(
                        18,
                        colorFont(),
                      ),
                    )
                  ],
                ),
              ),
            );
        }),
      ),
    );
  }

  showDialog1(String user, String clubId, String requestId) {
    return showDialog(
      context: context,
      builder: (context) {
        var deviceDimensions = MediaQuery.of(context).size;
        return CupertinoDialogAction(
          child: Transform.translate(
            offset: MediaQuery.of(context).viewInsets.bottom != 0
                ? Offset(0, -120)
                : Offset(0.0, 0),
            child: Container(
              width: deviceDimensions.width * 0.8,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: cardColor(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Material(
                color: cardColor(),
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                              child: Image.asset(
                                "assets/images/profile.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  user,
                                  style: textStyleGilroySB(
                                    16,
                                    colorFont(),
                                  ),
                                ),
                                Text(
                                  "Student",
                                  style: textStyleGilroyM(
                                    12,
                                    colorFontLight(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            child: Center(
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.close,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date",
                                  style: textStyleGilroySB(
                                    16,
                                    colorFont(),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: inputFieldColor(),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: GestureDetector(
                                    onTap: () => _selectDate(context),
                                    child: AbsorbPointer(
                                      child: TextFormField(
                                        style: textStyleGilroyM(
                                          16,
                                          inputFontColor(),
                                        ),
                                        keyboardType: TextInputType.text,
                                        controller: _date,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Select date",
                                          hintStyle: textStyleSofiaR(
                                            16,
                                            colorFontLight(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Time",
                                  style: textStyleGilroySB(
                                    16,
                                    colorFont(),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: inputFieldColor(),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: GestureDetector(
                                    onTap: () => _selectTime(context),
                                    child: AbsorbPointer(
                                      child: TextFormField(
                                        style: textStyleGilroyM(
                                          16,
                                          inputFontColor(),
                                        ),
                                        validator: (text) {
                                          if (text == null || text.isEmpty) {
                                            return "Please select time";
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.text,
                                        controller: _time,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Select time",
                                          hintStyle: textStyleSofiaR(
                                            16,
                                            colorFontLight(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add a message (optional)",
                            style: textStyleGilroySB(
                              16,
                              colorFont(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: inputFieldColor(),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              style: textStyleGilroyM(
                                18,
                                colorFont(),
                              ),
                              maxLines: 3,
                              controller: des,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Add message...",
                                hintStyle: textStyleSofiaR(
                                  16,
                                  colorFontLight(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: violet,
                        child: InkWell(
                          onTap: () {
                            interviewController.scheduleInterview(
                              user,
                              des.text,
                              _date.text,
                              _time.text,
                              clubId,
                              requestId,
                            );
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text("Schedule",
                                  style: textStyleSofiaSB(
                                    18,
                                    white,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
