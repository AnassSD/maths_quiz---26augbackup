// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import '../../../sizeConfig.dart';
import 'exercicesListContainer.dart';

class WidgetCouple extends StatelessWidget {
  String? image1, image2, text1, text2, root1, root2;
  WidgetCouple(
      {Key? key, this.image1,
      this.image2,
      this.text1,
      this.text2,
      this.root1,
      this.root2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockHorizontal * 45,
      margin:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeHorizontal * 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // left Container
          Expanded(
            child: ExercicesListContainer(
              side: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 1),
              text: text1!,
              image: image1!,
              root: root1,
            ),
          ),
          // right container
          Expanded(
            child: ExercicesListContainer(
              side: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 1),
              text: text2!,
              image: image2!,
              root: root2,
            ),
          )
        ],
      ),
    );
  }
}
