import 'package:flutter/material.dart';

import '../../sizeConfig.dart';

class MotivationalQuote extends StatelessWidget {
  const MotivationalQuote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 250, 249, 255),
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 5),
      ),
      height: SizeConfig.safeBlockVertical * 10,
      width: SizeConfig.safeBlockHorizontal * 96,
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical * 2,
      ),
      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Search',
          style: TextStyle(
            color: Colors.grey,
            fontSize: SizeConfig.safeBlockHorizontal * 4,
          ),
        ),
      ),
    );
  }
}
