import 'package:flutter/material.dart';
import '../sizeConfig.dart';

class NextButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: SizeConfig.safeBlockHorizontal * 50,
        padding:
            EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                SizeConfig.safeBlockHorizontal * 3),
            color:  Color.fromARGB(255, 234, 230, 253)),
        child: Text(
          'Next',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: SizeConfig.safeBlockHorizontal * 5,
          ),
        ),
      ),
      onTap: ()
      {

      },
    );
  }
}
