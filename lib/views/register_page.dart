import 'package:flutter/material.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/styles/styles.dart';

import 'package:workflow/views/clubs.dart';

import 'package:get/get.dart';

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
    double width = MediaQuery.of(context).size.width;

    return new Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
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
                                } else {
                                  Get.to(Clubs());
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
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: RadioListTile(
                      title: Text("Student"),
                      value: 0,
                      groupValue: _user,
                      onChanged: (val) {
                        selectRadio(val);
                      }),
                ),
                Expanded(
                  child: RadioListTile(
                      title: Text("Teacher"),
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
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(color: Colors.white),
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
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(color: Colors.white),
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
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(color: Colors.white),
            child: TextFormField(
              style: formFieldStyle,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Name",
                  hintStyle: hintStyle),
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
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(color: Colors.white),
            child: TextFormField(
              style: formFieldStyle,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Username",
                hintStyle: hintStyle,
              ),
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
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(color: Colors.white),
            child: TextFormField(
              style: formFieldStyle,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Mobile Number",
                  hintStyle: hintStyle),
            ),
          ),
        ),
      ],
    ),
  );
}

Step _thirdStep() {
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
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(color: Colors.white),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              style: formFieldStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Password",
                hintStyle: hintStyle,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
