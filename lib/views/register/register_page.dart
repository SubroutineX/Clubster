import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/register_controller.dart';
import 'package:workflow/controllers/show_password_controller.dart';
import 'package:workflow/views/CustomIcons.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/clubs/club_home.dart';

import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int currentStep = 0;
  bool complete = false;
  var _value = 'RSCOE';
  var _value2 = 'CS';
  var _user = 'student';

  RegisterController registerController = Get.put(RegisterController());
  @override
  void initState() {
    super.initState();
    _user = 'student';
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

  selectRadio(var val) {
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
                                  registerController.registerUser(
                                      _user, _value, _value2);
                                  Get.to(ClubHome());
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
                          fontSize: deviceSize.width < 400 ? 16 : 12,
                        ),
                      ),
                      value: 'student',
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
                      value: 'teacher',
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
                      value: 'RSCOE',
                    ),
                    DropdownMenuItem(
                      child: Text("DYP"),
                      value: 'DYP',
                    ),
                    DropdownMenuItem(
                      child: Text("Indira"),
                      value: 'Indira',
                    ),
                    DropdownMenuItem(
                      child: Text("PCCOE"),
                      value: 'PCCOE',
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
                      value: 'CS',
                    ),
                    DropdownMenuItem(
                      child: Text("IT"),
                      value: 'IT',
                    ),
                    DropdownMenuItem(
                      child: Text("ENTC"),
                      value: 'ENTC',
                    ),
                    DropdownMenuItem(
                      child: Text("Mechanical"),
                      value: 'MECHANICAL',
                    ),
                    DropdownMenuItem(
                      child: Text("Civil"),
                      value: 'CIVIL',
                    ),
                    DropdownMenuItem(
                      child: Text("Electrical"),
                      value: 'ELECTRICAL',
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

  Step _firstStep() {
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
                onChanged: (name) {
                  print('onchanged called' + name);

                  Get.find<RegisterController>().getName(name);
                },
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
                onChanged: (userName) {
                  Get.find<RegisterController>().getUsername(userName);
                },
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
                onChanged: (phone) {
                  Get.find<RegisterController>().getPhoneNumber(phone);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Step _thirdStep() {
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
                          onChanged: (password) {
                            Get.find<RegisterController>()
                                .getPassword(password);
                          },
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
}
