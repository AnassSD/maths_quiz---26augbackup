import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maths_quiz/constants/constantsColors.dart';

import 'sizeConfig.dart';

Color c1 = kViolet, c2 = kGrey, c3 = kGrey;
const newRouteName1 = '/home';
bool isNewRouteSameAsCurrent1 = false;
const newRouteName2 = '/account';
bool isNewRouteSameAsCurrent2 = false;
const newRouteName3 = '/home';
bool isNewRouteSameAsCurrent3 = false;

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(48, 0, 0, 0),
            blurRadius: 5.0,
            spreadRadius: 0.0,
            //             offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      height: SizeConfig.safeBlockVertical * 7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: FaIcon(
              FontAwesomeIcons.home,
              color: c1,
              size: SizeConfig.safeBlockHorizontal * 6,
            ),
            onTap: () {
              Navigator.popUntil(
                context,
                (route) {
                  //print("rout now" + route.settings.name.toString());
                  if (route.settings.name != newRouteName1) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, newRouteName1);
                  }
                  return true;
                },
              );

              setState(() {
                c1 = kViolet;
                c2 = c3 = kGrey;
              });
            },
          ),
          GestureDetector(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: c2,
              size: SizeConfig.safeBlockHorizontal * 6,
            ),
            onTap: () {
              Navigator.popUntil(
                context,
                (route) {
                  //print("rout now" + route.settings.name.toString());
                  if (route.settings.name != newRouteName2) {
                    //Navigator.pop(context);
                    Navigator.pushNamed(context, newRouteName2);
                  }
                  return true;
                },
              );
              setState(() {
                c2 = kViolet;
                c1 = c3 = kGrey;
              });
            },
          ),
          GestureDetector(
            child: FaIcon(
              FontAwesomeIcons.solidUser,
              color: c3,
              size: SizeConfig.safeBlockHorizontal * 6,
            ),
            onTap: () {
              setState(() {
                c3 = kViolet;
                c1 = c2 = kGrey;
              });
            },
          ),
        ],
      ),
    );
  }
}
