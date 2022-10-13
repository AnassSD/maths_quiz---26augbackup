// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:maths_quiz/authenticate/auth_controller.dart';
import 'package:maths_quiz/test.dart';
import '../../constants/constantsTextStyles.dart';

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
    return FutureBuilder<Acc?>(
      future: readUser(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something  went wrong! ${snapshot.error}');
        }
        //
        else if (snapshot.hasData) {
          final user = snapshot.data;
          return user == null
              ? const Center(
                  child: Text('No User'),
                )
              : Text(
                  'Hi, ${user.firstname}!',
                  style: kTextStyleName,
                );
        }
        //
        else {
          return Text(
            'Hi,',
            style: kTextStyleName,
          );
        }
      },
    );
  }
}
