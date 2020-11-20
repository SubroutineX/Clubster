import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/showPassword_controller.dart';
import 'package:workflow/views/CustomIcons.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/clubs/clubs.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int currentStep = 0;
  bool complete = false;
  int _value = 1;
  int _value2 = 1;
  int _user = 0;

  @override
  void initState() {
    super.initState();
    _user = 0;
  }

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  selectRadio(int val) {
    setState(() {
      _user = val;
    });
  }

  List<Step> get steps => <Step>[
        _firstStep(),
        _secondStep(),
        _thirdStep(),
      ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: loginSignup,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
              physics: BouncingScrollPhysics(),
              steps: steps,
              currentStep: currentStep,
              onStepContinue: next,
              onStepTapped: (step) => goTo(step),
              onStepCancel: cancel,
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.blueAccent,
                          child: currentStep < steps.length - 1
                              ? Text(
                                  "Next",
                                  style: TextStyle(color: Colors.white),
                                )
                              : Text(
                                  "Register",
                                  style: TextStyle(color: Colors.white),
                                ),
                          onPressed: () {
                            setState(
                              () {
                                if (currentStep < steps.length - 1) {
                                  currentStep = currentStep + 1;
                                } else {
                                  Get.to(Clubs());
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(width: 20),
                        FlatButton(
                          color: currentStep > 0
                              ? Colors.white
                              : Color(0xffcccccc),
                          child: currentStep > 0
                              ? Text(
                                  "Back",
                                  style: TextStyle(color: Colors.blueAccent),
                                )
                              : Text(
                                  "Back",
                                  style: TextStyle(color: Colors.black38),
                                ),
                          onPressed: () {
                            setState(
                              () {
                                if (currentStep > 0) {
                                  currentStep = currentStep - 1;
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Step _secondStep() {
    var deviceSize = MediaQuery.of(context).size;
    return Step(
      isActive: false,
      state: StepState.indexed,
      title: Text(
        'Step 2',
        style: formFieldStyle,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          FadeAnimation(
            3,
            Text(
              "User",
              style: labelStyle,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: RadioListTile(
                      activeColor: violet,
                      title: Text(
                        "Student",
                        style: TextStyle(
                          fontSize: deviceSize.width < 400 ? 16 : 14,
                        ),
                      ),
                      value: 0,
                      groupValue: _user,
                      onChanged: (val) {
                        selectRadio(val);
                      }),
                ),
                Expanded(
                  child: RadioListTile(
                      activeColor: violet,
                      title: Text(
                        "Teacher",
                        style: TextStyle(
                          fontSize: deviceSize.width < 400 ? 16 : 14,
                        ),
                      ),
                      value: 1,
                      groupValue: _user,
                      onChanged: (val) {
                        selectRadio(val);
                      }),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FadeAnimation(
            1,
            Text(
              "College",
              style: labelStyle,
            ),
          ),
          SizedBox(height: 10),
          FadeAnimation(
            2,
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("RSCOE"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("DYP"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Indira"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("PCCOE"),
                      value: 4,
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FadeAnimation(
            1,
            Text(
              "Department",
              style: labelStyle,
            ),
          ),
          SizedBox(height: 10),
          FadeAnimation(
            2,
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: formFieldStyle,
                  value: _value2,
                  items: [
                    DropdownMenuItem(
                      child: Text("CS"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("IT"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("ENTC"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("Mechanical"),
                      value: 4,
                    ),
                    DropdownMenuItem(
                      child: Text("Civil"),
                      value: 5,
                    ),
                    DropdownMenuItem(
                      child: Text("Electrical"),
                      value: 6,
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value2 = value;
                    });
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

Step _firstStep() {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  return Step(
    title: Text(
      'Step 1',
      style: formFieldStyle,
    ),
    isActive: true,
    state: StepState.indexed,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        FadeAnimation(
          1,
          Text(
            "Name",
            style: labelStyle,
          ),
        ),
        SizedBox(height: 10),
        FadeAnimation(
          2,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              style: formFieldStyle,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Name",
                  hintStyle: hintStyle),
              controller: nameController,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        FadeAnimation(
          3,
          Text(
            "Username",
            style: labelStyle,
          ),
        ),
        SizedBox(height: 10),
        FadeAnimation(
          4,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              style: formFieldStyle,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Username",
                hintStyle: hintStyle,
              ),
              controller: userNameController,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        FadeAnimation(
          1,
          Text(
            "Mobile Number",
            style: labelStyle,
          ),
        ),
        SizedBox(height: 10),
        FadeAnimation(
          2,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              style: formFieldStyle,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Mobile Number",
                  hintStyle: hintStyle),
              controller: phoneController,
            ),
          ),
        ),
      ],
    ),
  );
}

Step _thirdStep() {
  final TextEditingController passwordController = TextEditingController();

  final ShowPassController showPassword = Get.put(ShowPassController());
  return Step(
    isActive: false,
    state: StepState.indexed,
    title: Text(
      'Step 3',
      style: formFieldStyle,
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        FadeAnimation(
          3,
          Text(
            "Password",
            style: labelStyle,
          ),
        ),
        SizedBox(height: 10),
        FadeAnimation(
          4,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: passwordColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: GetBuilder(
              init: ShowPassController(),
              builder: (_) {
                return Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 45),
                      child: TextFormField(
                        obscureText: _.invisible,
                        style: formFieldStyle,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: hintStyle,
                        ),
                        controller: passwordController,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 6.5,
                      child: GestureDetector(
                        onTapDown: (TapDownDetails details) {
                          showPassword.showPass(details);
                        },
                        onTapUp: (TapUpDetails details) {
                          showPassword.hidePass(details);
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: loginSignup,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: _.invisible
                                ? Icon(
                                    CustomIcons.eye,
                                    size: 17,
                                    color: fontColorLight.withOpacity(.35),
                                  )
                                : Icon(
                                    CustomIcons.eye_off,
                                    size: 17,
                                    color: fontColorLight.withOpacity(.35),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}
