import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:workflow/controllers/auth_controller.dart';
import 'package:workflow/controllers/show_password_controller.dart';

//WIDGETS
import 'package:workflow/views/widgets/buttonBuilder.dart';
import 'package:workflow/views/widgets/inputField.dart';
import 'package:workflow/views/widgets/passwordInput.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

//PAGES
import 'package:workflow/views/clubs/page_navigator.dart';

class Loginpage extends StatelessWidget {
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
                        Text(
                          "Login",
                          style: textStyleSofiaB(30, fontColor),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Access account",
                          style: textStyleSofiaL(18, fontColorLight),
                        ),
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
                        InputBuilder(
                          fieldController: phoneController,
                          inputHead: "Mobile number",
                          hintText: "Enter mobile number",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        PasswordInput(
                          passwordController: passwordController,
                          showPassword: showPassword,
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
                                style: textStyleSofiaR(15, fontColorLight),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GradientButtonBuilder(
                      buttonText: "Login",
                      colors: [
                        blue,
                        violet,
                      ],
                      onTap: () {
                        Get.find<AuthController>().loginUser(
                            phoneController.text, passwordController.text);
                      },
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: textStyleSofiaR(15, fontColorLight),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  loginPageTabController.animateTo(1);
                                },
                              text: "Register.",
                              style: textStyleSofiaB(15, fontColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(PageNavigator());
                                },
                              text: "Bypass Login",
                              style: textStyleSofiaB(15, fontColor),
                            ),
                          ],
                        ),
                      ),
                    ],
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
