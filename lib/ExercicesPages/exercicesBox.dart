// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:maths_quiz/constants/constantsTextStyles.dart';

import '../../../sizeConfig.dart';

class ExercicesBox extends StatelessWidget {
  String? image;
  String? text;
  String? root;
  ExercicesBox({Key? key, this.image, this.text, this.root}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, root!);
      },
      child: Container(
        // width: SizeConfig.safeBlockHorizontal*92,
        height: SizeConfig.safeBlockVertical * 24,
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 6),
        margin:
            EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 1.5),
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('images/$image'),
            //   fit: BoxFit.fill,
            // ),
            borderRadius:
                BorderRadius.circular(SizeConfig.safeBlockHorizontal * 8),
            color: const Color.fromARGB(255, 236, 151, 144)),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            text!,
            style: kWidgetTitleStyles,
          ),
        ),
      ),
    );
  }
}
