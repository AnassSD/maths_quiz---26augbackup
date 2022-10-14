// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../constants/constantsTextStyles.dart';
import '../sizeConfig.dart';
import 'SignUpPage.dart';
import 'auth_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
                  image: AssetImage('images/SignInBackground.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Back button
                    GestureDetector(
                      child: FaIcon(
                        FontAwesomeIcons.angleLeft,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        size: SizeConfig.safeBlockHorizontal * 8,
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 7,
                    ),
                    //Welcoming line
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: SizeConfig.safeBlockHorizontal * 11,
                      ),
                    ),
                    Text(
                      'We are happy to see you here!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 7,
                    ),
                    //Sign up title
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.safeBlockVertical * 1),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: SizeConfig.safeBlockHorizontal * 10,
                        ),
                      ),
                    ),

                    //Name input
                    UserDataInputWhite(
                      textEditingController: emailController,
                      icon: Icons.email_outlined,
                      label: 'Email',
                      hintText: 'Type your email Address',
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    //Email input
                    UserDataPasswordInputWhite(
                      textEditingController: passwordController,
                      icon: Icons.key_outlined,
                      label: 'Password',
                      hintText: 'Type your password',
                    ),

                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 8,
                    ),
                    //Sign In button
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
                          AuthController.instance.login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        },
                        child: Text(
                          'Sign in',
                          style: kSignUpButton,
                        ),
                      ),
                    ),

                    //Already have an account + login button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dont have an account?',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 46, 55, 70),
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        //Sign up button
                        TextButton(
                          onPressed: () {
                            Get.off(
                              const SignUpPage(),
                              transition: Transition.rightToLeft,
                            );
                          },
                          child: Text(
                            'Sign up',
                            style: kSignInButton,
                          ),
                        ),
                      ],
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

class UserDataInputWhite extends StatelessWidget {
  String? hintText, label;
  IconData? icon;
  TextEditingController? textEditingController;
  UserDataInputWhite({
    Key? key,
    required this.hintText,
    required this.label,
    required this.icon,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      onChanged: (value) {},
      controller: textEditingController,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        suffixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        hintText: hintText,
        label: Text(
          label!,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.safeBlockHorizontal * 4,
          ),
        ),
      ),
    );
  }
}

class UserDataPasswordInputWhite extends StatelessWidget {
  String? hintText, label;
  IconData? icon;
  TextEditingController? textEditingController;
  UserDataPasswordInputWhite({
    Key? key,
    required this.hintText,
    required this.label,
    required this.icon,
    this.textEditingController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      obscureText: true,
      onChanged: (value) {},
      controller: textEditingController,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        suffixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        hintStyle: kInteractionButtonsText,
        hintText: hintText,
        label: Text(
          label!,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.safeBlockHorizontal * 4,
          ),
        ),
      ),
    );
  }
}
