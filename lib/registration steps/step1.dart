import 'package:flutter/material.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/styles/styles.dart';

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
