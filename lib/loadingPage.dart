import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:maths_quiz/main.dart';
import 'package:maths_quiz/sizeConfig.dart';

class LoadingAnimationPage extends StatefulWidget {
  const LoadingAnimationPage({Key? key}) : super(key: key);

  @override
  State<LoadingAnimationPage> createState() => _LoadingAnimationPageState();
}

class _LoadingAnimationPageState extends State<LoadingAnimationPage> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 3500), () {
      Get.offAll(
        () => Quiz(),
        transition: Transition.rightToLeft,
        duration: Duration(
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
        color: Colors.white,
        alignment: Alignment.center,
        height: SizeConfig.safeBlockVertical * 100,
        width: SizeConfig.safeBlockHorizontal * 100,
        child: Align(
          alignment: Alignment.center,
          child: Lottie.asset(
            'assets/AppIcon.mp4.lottie.json',
            width: SizeConfig.safeBlockHorizontal * 27,
          ),
        ),
      ),
    );
  }
}
