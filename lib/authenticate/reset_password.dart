import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:maths_quiz/authenticate/auth_controller.dart';
import 'package:maths_quiz/constants/constantsColors.dart';
import 'package:maths_quiz/sizeConfig.dart';

import '../constants/constantsTextStyles.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 7,
                  vertical: SizeConfig.safeBlockVertical * 2),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/ResetPasswordBackground.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: FaIcon(
                        FontAwesomeIcons.times,
                        color: kDarkGrey,
                        size: SizeConfig.safeBlockHorizontal * 8,
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 14,
                    ),
                    //Reset Password Title
                    Text(
                      'Reset Password',
                      style: TextStyle(
                        color: kMidGrey,
                        fontWeight: FontWeight.w800,
                        fontSize: SizeConfig.safeBlockHorizontal * 11,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    Text(
                      "Enter the email assosciated with your account and we'll send an email with instructionss to reset your password.",
                      style: TextStyle(
                        color: kMidGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 5,
                    ),
                    UserDataInputGrey(
                      textEditingController: emailController,
                      icon: Icons.email_outlined,
                      label: 'Email',
                      hintText: 'Type your email Address',
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 4,
                    ),
                    //Reset button
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.safeBlockHorizontal * 4.5),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 46, 55, 70),
                          ),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                              vertical: SizeConfig.safeBlockVertical * 1.5,
                              horizontal: SizeConfig.safeBlockHorizontal * 10,
                            ),
                          ),
                        ),
                        onPressed: () {
                          AuthController.instance.resetPassword(
                            emailController.text.trim(),
                          );
                        },
                        child: Text(
                          'Reset',
                          style: kSignUpButton,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class UserDataInputGrey extends StatelessWidget {
  String? hintText, label;
  IconData? icon;
  TextEditingController? textEditingController;
  UserDataInputGrey({
    Key? key,
    required this.hintText,
    required this.label,
    required this.icon,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: kMidGrey),
      onChanged: (value) {},
      controller: textEditingController,
      cursorColor: kMidGrey,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kMidGrey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kMidGrey),
        ),
        suffixIcon: Icon(
          icon,
          color: kMidGrey,
        ),
        hintText: hintText,
        label: Text(
          label!,
          style: TextStyle(
            color: kMidGrey,
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.safeBlockHorizontal * 4,
          ),
        ),
      ),
    );
  }
}
