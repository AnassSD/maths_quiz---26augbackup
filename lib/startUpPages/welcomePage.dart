// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key, required this.email}) : super(key: key);
  String email;
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'hello ' + widget.email,
        ),
      ),
    );
  }
}
