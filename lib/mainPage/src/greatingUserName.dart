// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:maths_quiz/test.dart';
import '../../constants/constantsTextStyles.dart';
import '../../verifyEmail.dart';

class GreatingUserName extends StatefulWidget {
  const GreatingUserName({
    Key? key,
  }) : super(key: key);

  @override
  State<GreatingUserName> createState() => _GreatingUserNameState();
}

class _GreatingUserNameState extends State<GreatingUserName> {
  TestWidget? data;
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hi, ${userInfo!.firstname}!',
      style: kTextStyleName,
    );
  }
}
