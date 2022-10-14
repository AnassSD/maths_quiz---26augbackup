// ignore_for_file: file_names

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:maths_quiz/authenticate/auth_controller.dart';
import 'package:maths_quiz/sizeConfig.dart';

import 'constants/constantsTextStyles.dart';
import 'loadingPage.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

Acc? userInfo;

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  Timer? timer;
  bool canResendEmail = false;
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(const Duration(seconds: 5));
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Acc?>(
      future: readUser(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something  went wrong! ${snapshot.error}');
        }
        //
        else if (snapshot.hasData) {
          final user = snapshot.data;
          userInfo = user!;
          // ignore: unnecessary_null_comparison
          if (user == null) {
            return const Center(
              child: Text('No User Found'),
            );
          } else {
            if (isEmailVerified == true) {
              return const LoadingAnimationPage();
            } else {
              return Scaffold(
                backgroundColor: Colors.white,
                body: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 7,
                      vertical: SizeConfig.safeBlockVertical * 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 15,
                      ),
                      //lottie animation
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 2,
                        ),
                        child: Container(
                          //height:SizeConfig.safeBlockVertical*50,
                          child: Lottie.asset('assets/emailverification.json'),
                        ),
                      ),
                      Text(
                        'Please Verify Your Email',
                        style: kTitleStyles,
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 2,
                      ),
                      Text(
                        'An email verification link has been sent to you, please check your email & click the link to activate your account.',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                          fontFamily: 'OpenSans',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 5,
                      ),

                      //resend verification button
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            if (canResendEmail == true) {
                              sendVerificationEmail();
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.safeBlockHorizontal * 5,
                                ),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 46, 55, 70),
                            ),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                vertical: SizeConfig.safeBlockVertical * 2,
                                horizontal: SizeConfig.safeBlockHorizontal * 10,
                              ),
                            ),
                          ),
                          child: Text(
                            'Resend verification',
                            style: kSignUpButton,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 1,
                      ),
                      //cancel button
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () => FirebaseAuth.instance.signOut(),
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
                          child: Text(
                            'Cancel',
                            style: kSignUpButton,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
        }
        //
        else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
