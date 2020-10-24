import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
                        Text(
                          "Login",
                          style: headingStyle,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Access account",
                          style: subHeadingStyle,
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
                        Text(
                          "Email",
                          style: labelStyle,
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(color: Colors.white),
                          child: TextFormField(
                            style: formFieldStyle,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: hintStyle),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Password",
                          style: labelStyle,
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(color: Colors.white),
                          child: TextFormField(
                            obscureText: true,
                            style: formFieldStyle,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: hintStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
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
                  SizedBox(height: 40),
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
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
