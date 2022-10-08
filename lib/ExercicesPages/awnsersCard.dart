// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:maths_quiz/constants/constantsColors.dart';
import 'package:maths_quiz/constants/constantsTextStyles.dart';

class AwnsersChoicesCart extends StatefulWidget {
  String? textData;
  Color? color;
  AwnsersChoicesCart({Key? key, this.textData, this.color}) : super(key: key);

  @override
  State<AwnsersChoicesCart> createState() => _AwnsersChoicesCartState();
}

Color initialColor = Colors.white;

class _AwnsersChoicesCartState extends State<AwnsersChoicesCart> {
  @override
  Widget build(BuildContext context) {
    String? textData = widget.textData;
    Color? color = widget.color;
    return GestureDetector(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Text(
              textData!,
              style: kAwnserCardText,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: color,
          boxShadow: const [
            //background color of box
            BoxShadow(
              color: Color.fromARGB(255, 224, 219, 218),
              blurRadius: 3, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                0, // Move to right 10  horizontally
                0, // Move to bottom 10 Vertically
              ),
            )
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(vertical: 7),
      ),
      onTap: () {
        setState(() {
          color = kLightViolet;
        });
      },
    );
  }
}
