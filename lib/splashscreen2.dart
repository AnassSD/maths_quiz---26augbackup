import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maths_quiz/sizeConfig.dart';
import 'package:maths_quiz/startUpPages/welcomeLoginPage.dart';

class SplashScreenPage2 extends StatefulWidget {
  const SplashScreenPage2({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage2> createState() => _SplashScreenPageState2();
}

class _SplashScreenPageState2 extends State<SplashScreenPage2> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(
        () => const WelcomeLoginPage(),
        transition: Transition.fade,
        duration: const Duration(
          milliseconds: 500,
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Image.asset(
          'assets/AppIcon.png',
          width: SizeConfig.safeBlockHorizontal * 27,
        ),
      ),
    );
  }
}
