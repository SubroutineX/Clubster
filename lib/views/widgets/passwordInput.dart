import 'package:flutter/material.dart';

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:workflow/controllers/show_password_controller.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/CustomIcons.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key key,
    @required this.passwordController,
    @required this.showPassword,
  }) : super(key: key);

  final TextEditingController passwordController;
  final ShowPassController showPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: labelStyle,
        ),
        SizedBox(height: 10),
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
      ],
    );
  }
}
