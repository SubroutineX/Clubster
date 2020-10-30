import 'package:flutter/material.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/styles/styles.dart';

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
