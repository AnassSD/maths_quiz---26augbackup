// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../../main.dart';
import '../../sizeConfig.dart';
import '../../constants/constantsTextStyles.dart';

class UnderTitles extends StatefulWidget {
  String? text, soustext;
  String? root;
  UnderTitles({Key? key, this.text, this.soustext, this.root}) : super(key: key);

  @override
  State<UnderTitles> createState() => _UnderTitlesState();
}

class _UnderTitlesState extends State<UnderTitles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text!,
            style: kTitleStyles,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Quiz.pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              });
            },
            child: Text(
              widget.soustext!,
              style: kInteractionButtonsText,
            ),
          ),
        ],
      ),
    );
  }
}
