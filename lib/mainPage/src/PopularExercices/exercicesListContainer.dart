import 'package:flutter/material.dart';
import 'package:maths_quiz/constants/constantsTextStyles.dart';

import '../../../sizeConfig.dart';

class ExercicesListContainer extends StatelessWidget {
  EdgeInsets? side;
  String? image;
  String? text;
  String? root;
  ExercicesListContainer({this.side, this.image, this.text, this.root});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, root!);
      },
      child: Container(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 6),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$image'),
              fit: BoxFit.fill,
            ),
            borderRadius:
                BorderRadius.circular(SizeConfig.safeBlockHorizontal * 8),
            color: Colors.transparent),
        margin: side,
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
