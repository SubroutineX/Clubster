import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/styles/styles.dart';

class Loginpage extends StatelessWidget {
  TabController loginPageTabController;

  Loginpage(this.loginPageTabController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment(0.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        FadeAnimation(
                          1,
                          Text(
                            "Login",
                            style: headingStyle,
                          ),
                        ),
                        SizedBox(height: 15),
                        FadeAnimation(
                          2,
                          Text(
                            "Access account",
                            style: subHeadingStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(
                          3,
                          Text(
                            "Mobile Number",
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
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Mobile Number",
                                  hintStyle: hintStyle),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                          5,
                          Text(
                            "Password",
                            style: labelStyle,
                          ),
                        ),
                        SizedBox(height: 10),
                        FadeAnimation(
                          6,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(color: Colors.white),
                            child: TextFormField(
                              obscureText: true,
                              style: formFieldStyle,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: hintStyle,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          7,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RichText(
                                text: TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("Forgot pass");
                                    },
                                  text: "Forgot Password?",
                                  style: questionStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  FadeAnimation(
                    8,
                    Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              'Login',
                              style: buttonTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  FadeAnimation(
                    9,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account? ",
                                style: questionStyle,
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    loginPageTabController.animateTo(1);
                                  },
                                text: "Register.",
                                style: questionStyleBold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
