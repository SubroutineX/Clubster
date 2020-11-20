import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/auth_controller.dart';
import 'package:workflow/controllers/showPassword_controller.dart';
import 'package:workflow/views/CustomIcons.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class Loginpage extends GetWidget<AuthController> {
  final TabController loginPageTabController;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ShowPassController showPassword = Get.put(ShowPassController());
  // Toggles the password show status

  Loginpage(this.loginPageTabController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: loginSignup,
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
                  SizedBox(height: 80),
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
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              style: formFieldStyle,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Mobile Number",
                                  hintStyle: hintStyle),
                              controller: phoneController,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: _.invisible
                                                ? Icon(
                                                    CustomIcons.eye,
                                                    size: 17,
                                                    color: fontColorLight
                                                        .withOpacity(.35),
                                                  )
                                                : Icon(
                                                    CustomIcons.eye_off,
                                                    size: 17,
                                                    color: fontColorLight
                                                        .withOpacity(.35),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: AlignmentDirectional.bottomEnd,
                              colors: [
                                blue,
                                violet,
                              ],
                            )),
                        child: GestureDetector(
                          onTap: () {
                            Get.find<AuthController>().loginUser(
                                phoneController.text, passwordController.text);
                          },
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
                  SizedBox(height: 25),
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
