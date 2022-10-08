import 'package:flutter/material.dart';
import 'package:maths_quiz/sizeConfig.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  // void initState() {
  //   Future.delayed(Duration(seconds: 5), () {
  //     Get.offAll(
  //       () => WelcomeLoginPage(),
  //       transition: Transition.fade,
  //       duration: Duration(
  //         milliseconds: 500,
  //       ),
  //     );
  //   });

  //   super.initState();
  // }

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
