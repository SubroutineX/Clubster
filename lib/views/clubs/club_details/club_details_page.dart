import 'package:flutter/material.dart';

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:workflow/controllers/club_controller.dart';

//PACKAGES
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:workflow/controllers/follows_controller.dart';
import 'package:workflow/controllers/join_club_controller.dart';

//PAGES
import 'package:workflow/views/clubs/club_details/club_detail_sheet.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

//WIDGETS
import 'package:workflow/views/widgets/buttonBuilder.dart';

class ClubDetailsPage extends StatefulWidget {
  dynamic clubInfo;

  ClubDetailsPage({Key key, @required this.clubInfo});

  @override
  _ClubDetailsPageState createState() => _ClubDetailsPageState();
}

class _ClubDetailsPageState extends State<ClubDetailsPage> {
  String token;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final cController = Get.find<ClubController>();
  final joinController = Get.put(JoinClub());
  TextEditingController des = TextEditingController();

  void getStat() async {
    List value = await cController.fetchFollowingStat(
        widget.clubInfo.clubName, widget.clubInfo.id);
    setState(() {
      widget.clubInfo.requested = value[0];
      widget.clubInfo.joined = value[1];
      widget.clubInfo.following = value[2];
    });
  }

  @override
  void initState() {
    super.initState();

    getStat();
  }

  final followsController = Get.put(FollowsController());

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: deviceDimensions.width,
              height: deviceDimensions.height,
              child: SlidingSheet(
                cornerRadius: 30,
                scrollSpec: ScrollSpec.bouncingScroll(),
                snapSpec: const SnapSpec(
                  snap: true,
                  snappings: [0.6, 1],
                  positioning: SnapPositioning.relativeToAvailableSpace,
                ),
                body: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: deviceDimensions.width,
                        height: deviceDimensions.height * 0.45,
                        child: Hero(
                          tag: widget.clubInfo.id,
                          child: Image.network(
                            "http://65.1.43.39:8000/fetchClubImage?imageName=" +
                                widget.clubInfo.clubName +
                                ".jpg",
                            headers: {"Authorization": "Bearer $token"},
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: deviceDimensions.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () => Get.back(closeOverlays: true),
                              icon: Icon(
                                Icons.chevron_left,
                                color: white,
                                size: 35,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_none_outlined,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                builder: (context, state) {
                  return ClubDetailSheet(clubInfo: widget.clubInfo);
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: deviceDimensions.width,
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: fontColor.withOpacity(.1),
                    offset: Offset(0, -3),
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.clubInfo.status == "open"
                      ? ButtonBuilder(
                          multiple: .55,
                          height: 48,
                          buttonText: widget.clubInfo.joined ?? false
                              ? "joined"
                              : "Join",
                          color:
                              widget.clubInfo.joined ?? false ? white : violet,
                          txtColor:
                              widget.clubInfo.joined ?? false ? blue : white,
                          splashColor: violetSplash,
                          onTapCall: () {
                            if (!widget.clubInfo.joined) {
                              joinController.joinClub(
                                  widget.clubInfo.id, widget.clubInfo.status);
                            } else {
                              joinController.exitClub(widget.clubInfo.id);
                            }
                            setState(
                              () {
                                widget.clubInfo.joined =
                                    !widget.clubInfo.joined;
                              },
                            );
                          },
                        )
                      : ButtonBuilder(
                          multiple: .55,
                          height: 48,
                          buttonText: widget.clubInfo.requested ?? false
                              ? "Requested"
                              : "Join",
                          color: widget.clubInfo.requested ?? false
                              ? white
                              : violet,
                          txtColor:
                              widget.clubInfo.requested ?? false ? blue : white,
                          splashColor: violetSplash,
                          onTapCall: () {
                            if (!widget.clubInfo.requested) {
                              displayPersistentBottomSheet();
                            }
                            setState(
                              () {
                                widget.clubInfo.requested =
                                    !widget.clubInfo.requested;
                              },
                            );
                          },
                        ),
                  ButtonBuilder(
                    multiple: .35,
                    height: 48,
                    buttonText: widget.clubInfo.following ?? false
                        ? "Following"
                        : "Follow",
                    color: widget.clubInfo.following ?? false ? white : blue,
                    txtColor: widget.clubInfo.following ?? false ? blue : white,
                    splashColor: blueSplash,
                    onTapCall: () {
                      if (!widget.clubInfo.following) {
                        followsController.follow(
                            widget.clubInfo.clubName, "club");
                      } else {
                        followsController.unfollow(
                            widget.clubInfo.clubName, "club");
                      }
                      setState(
                        () {
                          widget.clubInfo.following =
                              !widget.clubInfo.following;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void displayPersistentBottomSheet() {
    _scaffoldKey.currentState.showBottomSheet<void>(
      (BuildContext context) {
        return Container(
          color: Colors.white,
          height: 260,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Why join us?",
                  style: textStyleSofiaSB(
                    20,
                    colorFont(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: inputFieldColor(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    style: textStyleGilroyM(
                      18,
                      colorFont(),
                    ),
                    controller: des,
                    maxLines: 4,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add caption...",
                      hintStyle: textStyleSofiaR(
                        16,
                        colorFontLight(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonBuilder(
                      multiple: .40,
                      height: 48,
                      buttonText: "cancel",
                      color: violet,
                      txtColor: white,
                      splashColor: violetSplash,
                      onTapCall: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ButtonBuilder(
                      multiple: .40,
                      height: 48,
                      buttonText: "send",
                      color: blue,
                      txtColor: white,
                      splashColor: blueSplash,
                      onTapCall: () {
                        joinController.requestToJoin(
                            widget.clubInfo.id, des.text);
                        navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }
}
