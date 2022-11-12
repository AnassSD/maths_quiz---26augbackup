import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constantsTextStyles.dart';
import '../sizeConfig.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical * 80,
      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //back button and save
            Padding(
              padding:
                  EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 1),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.angleLeft,
                    size: SizeConfig.safeBlockHorizontal * 8,
                  ),
                ],
              ),
            ),

            Text(
              'Quizo does not send you yet any notifications yet, we still working on it so you can set routines to solve some exercices.',
              style: kInteractionButtonsText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
