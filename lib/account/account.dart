import 'package:flutter/material.dart';
import 'profile.dart';

class AccMainPage extends StatelessWidget {
  const AccMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Profile(),
      ),
    );
  }
}
