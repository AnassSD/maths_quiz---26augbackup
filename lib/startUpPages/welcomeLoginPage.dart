import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:maths_quiz/constants/constantsColors.dart';
import 'package:maths_quiz/constants/constantsTextStyles.dart';
import 'package:maths_quiz/sizeConfig.dart';
import 'package:maths_quiz/startUpPages/SignUpPage.dart';

import 'SignInPage.dart';

class WelcomeLoginPage extends StatefulWidget {
  const WelcomeLoginPage({Key? key}) : super(key: key);

  @override
  State<WelcomeLoginPage> createState() => _WelcomeLoginPageState();
}

class _WelcomeLoginPageState extends State<WelcomeLoginPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.safeBlockHorizontal * 7,
                  right: SizeConfig.safeBlockVertical * 2,
                  left: SizeConfig.safeBlockVertical * 2,
                ),
                child: Column(
                  children: [
                    //Math for everyone
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Math for ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: SizeConfig.safeBlockHorizontal * 13,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          TextSpan(
                            text: 'every',
                            style: TextStyle(
                              color: Color(0xff615EA8),
                              fontWeight: FontWeight.w800,
                              fontSize: SizeConfig.safeBlockHorizontal * 13,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          TextSpan(
                            text: 'one!',
                            style: TextStyle(
                              color: kViolet,
                              fontWeight: FontWeight.w800,
                              fontSize: SizeConfig.safeBlockHorizontal * 13,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: " Welcome to ",
                              style: kInteractionButtonsText,
                            ),
                            TextSpan(
                              text: "Quizo.",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w800,
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            TextSpan(
                              text: " Let's start the fun!",
                              style: kInteractionButtonsText,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 17,
                    ),
                  ],
                ),
              ),
              //lottie animation
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 2,
                ),
                child: Container(
                  //height:SizeConfig.safeBlockVertical*50,
                  child: Lottie.asset('assets/welcomingPageAnimation.json'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: SizeConfig.safeBlockHorizontal * 7,
                  right: SizeConfig.safeBlockVertical * 2,
                  left: SizeConfig.safeBlockVertical * 2,
                ),
                child: Column(
                  children: [
                    //Start button
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.safeBlockHorizontal * 4.5),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(kViolet),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                            vertical: SizeConfig.safeBlockVertical * 2,
                            horizontal: SizeConfig.safeBlockHorizontal * 7,
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          Get.to(
                            () => SignUpPage(),
                            transition: Transition.rightToLeft,
                          );
                        });
                      },
                      child: Text(
                        'Start',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                        ),
                      ),
                    ),
                    //Margin
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    //Already have an account + login button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: kInteractionButtonsText,
                        ),
                        //Sign in button
                        TextButton(
                          onPressed: () {
                            Get.to(
                              () => SignInPage(),
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
            ],
          ),
        ),
      ),
    );
  }
}
