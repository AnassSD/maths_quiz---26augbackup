// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:maths_quiz/auth_controller.dart';
import 'package:maths_quiz/constants/constantsColors.dart';

import '../constants/constantsTextStyles.dart';
import '../sizeConfig.dart';
import 'SignInPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var lastNameController = TextEditingController();
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
                  image: AssetImage('images/SignUpBackground.png'),
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
                        FontAwesomeIcons.angleLeft,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        size: SizeConfig.safeBlockHorizontal * 8,
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 15,
                    ),
                    //Sign up title
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.safeBlockVertical * 1),
                      child: Text(
                        'Sign up',
                        style: kTextStyleName,
                      ),
                    ),
                    //Welcoming line
                    Text(
                      'We are happy to see you here!',
                      style: kInteractionButtonsText,
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 35,
                          child: UserDataInput(
                            textEditingController: nameController,
                            icon: null,
                            label: 'First Name',
                            hintText: 'Type your first name',
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 45,
                          child: UserDataInput(
                            textEditingController: lastNameController,
                            icon: Icons.person_outline_rounded,
                            label: 'Last Name',
                            hintText: 'Type your last name',
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    //Email input
                    UserDataInput(
                      textEditingController: emailController,
                      icon: Icons.email_outlined,
                      label: 'Email',
                      hintText: 'Type your email Address',
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    //Password input
                    UserDataPasswordInput(
                      textEditingController: passwordController,
                      icon: Icons.key_outlined,
                      label: 'Password',
                      hintText: 'Type your password',
                    ),

                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 8,
                    ),
                    //Sign up button
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
                          AuthController.instance.register(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            nameController.text.trim(),
                            lastNameController.text.trim(),
                          );
                        },
                        child: Text(
                          'Create',
                          style: kSignUpButton,
                        ),
                      ),
                    ),

                    //Already have an account + login button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: kSignInPhraseText,
                        ),
                        //Sign in button
                        TextButton(
                          onPressed: () {
                            Get.off(
                              () => const SignInPage(),
                              transition: Transition.rightToLeft,
                            );
                          },
                          child: Text(
                            'Sign in',
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

class UserDataInput extends StatelessWidget {
  String? hintText, label;
  IconData? icon;
  TextEditingController? textEditingController;
  UserDataInput({
    Key? key,
    required this.hintText,
    required this.label,
    required this.icon,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      controller: textEditingController,
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

class UserDataPasswordInput extends StatelessWidget {
  String? hintText, label;
  IconData? icon;
  TextEditingController? textEditingController;
  UserDataPasswordInput({
    Key? key,
    required this.hintText,
    required this.label,
    required this.icon,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      onChanged: (value) {},
      controller: textEditingController,
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
