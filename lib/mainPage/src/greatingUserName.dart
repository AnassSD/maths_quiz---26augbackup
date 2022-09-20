import 'package:flutter/material.dart';
import '../../account/profile.dart';
import '../../constants/constantsTextStyles.dart';
//import 'package:flutter_math/flutter_math.dart';

class GreatingUserName extends StatefulWidget {
  const GreatingUserName({
    Key? key,
  }) : super(key: key);

  @override
  State<GreatingUserName> createState() => _GreatingUserNameState();
}

class _GreatingUserNameState extends State<GreatingUserName> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hi, Anas!',
      style: kTextStyleName,
    );
  }
}
