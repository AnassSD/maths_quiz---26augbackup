// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../sizeConfig.dart';
import 'constantsColors.dart';

// Used in mainPage for the MainColumn
final EdgeInsets kColumnPadding = EdgeInsets.only(
  top: SizeConfig.safeBlockVertical * 1,
  left: SizeConfig.safeBlockHorizontal * 4,
  right: SizeConfig.safeBlockHorizontal * 4,
);

// Used in Greeting+Name in the main page
final kTextStyleName = TextStyle(
  fontWeight: FontWeight.w800,
  fontSize: SizeConfig.safeBlockHorizontal * 10,
);
final kTextStyleNameBlack = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w800,
  fontSize: SizeConfig.safeBlockHorizontal * 10,
);
//Used in Profile Name
final kProfileNameTextStyle = TextStyle(
  fontWeight: FontWeight.w800,
  fontSize: SizeConfig.safeBlockHorizontal * 9,
);
final kProfileFunctionKey = TextStyle(
  color: kDarkGrey,
  fontWeight: FontWeight.w800,
  fontSize: SizeConfig.safeBlockHorizontal * 4.5,
);
// Used in Titles
final kTitleStyles = TextStyle(
  fontWeight: FontWeight.w800,
  fontSize: SizeConfig.safeBlockHorizontal * 6.5,
);
// Used in Titles of Widgets
final kWidgetTitleStyles = TextStyle(
  fontWeight: FontWeight.w800,
  fontSize: SizeConfig.safeBlockHorizontal * 4.7,
);

// Used in optionalButtons
final kInteractionButtonsText = TextStyle(
  color: Colors.grey.shade700,
  fontWeight: FontWeight.w500,
  fontSize: SizeConfig.safeBlockHorizontal * 4,
  fontFamily: 'OpenSans',
);

// Used in Awnser choices Cards Font
final kAwnserCardText = TextStyle(
  fontWeight: FontWeight.w800,
  fontSize: SizeConfig.safeBlockHorizontal * 5,
);
final kSignInButton = TextStyle(
  color: kDarkGrey,
  fontWeight: FontWeight.w700,
  fontSize: SizeConfig.safeBlockHorizontal * 4,
);
final kSignUpButton = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: SizeConfig.safeBlockHorizontal * 4,
);
final kSignInPhraseText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: SizeConfig.safeBlockHorizontal * 4,
);
