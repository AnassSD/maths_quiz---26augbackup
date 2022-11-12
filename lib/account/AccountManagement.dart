// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:maths_quiz/authenticate/auth_controller.dart';
import 'package:maths_quiz/constants/constantsColors.dart';
import 'package:maths_quiz/constants/constantsTextStyles.dart';
import 'package:maths_quiz/sizeConfig.dart';
import 'package:maths_quiz/verifyEmail.dart';

class AccountManagement extends StatefulWidget {
  const AccountManagement({Key? key}) : super(key: key);

  @override
  State<AccountManagement> createState() => _AccountManagementState();
}

class _AccountManagementState extends State<AccountManagement> {
  var passwordController = TextEditingController();
  @override
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

            //Show email address
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email address',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 0.5,
                  ),
                  Text(
                    '${userInfo!.email}',
                    style: TextStyle(
                      color: kDarkGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                    ),
                  ),
                ],
              ),
            ),
            //Reset password
            GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  titlePadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 5,
                      vertical: SizeConfig.safeBlockVertical * 2),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 5,
                      vertical: SizeConfig.safeBlockVertical * 1),
                  title: "Please confirm your current password.",
                  middleText: '',
                  backgroundColor: kViolet,
                  titleStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    color: Colors.white,
                  ),
                  radius: 30,
                  //content
                  content: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.safeBlockVertical * 2,
                            horizontal: SizeConfig.safeBlockHorizontal * 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        child: UserDataPasswordInputConfirmation(
                          textEditingController: passwordController,
                          icon: Icons.key_outlined,
                          label: 'Password',
                          hintText: 'Type your password',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.safeBlockHorizontal * 5,
                                color: kDarkGrey,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              //Write delete functon here
                              AuthController.instance
                                  .verifyAccBeforePasswordReset(
                                passwordController.text.trim(),
                              );
                            },
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: SizeConfig.safeBlockHorizontal * 5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Change password',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                      ),
                    ),
                    FaIcon(
                      FontAwesomeIcons.angleRight,
                      size: SizeConfig.safeBlockHorizontal * 7,
                    ),
                  ],
                ),
              ),
            ),
            //Delete account and data
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 1.5),
              child: GestureDetector(
                child: Text(
                  'Delete Account',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                    color: Colors.redAccent,
                  ),
                ),
                onTap: () {
                  Get.defaultDialog(
                    titlePadding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 5,
                        vertical: SizeConfig.safeBlockVertical * 2),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 5,
                        vertical: SizeConfig.safeBlockVertical * 1),
                    title: 'Are you sure you want to Delete your Account?',
                    middleText: '',
                    backgroundColor: Colors.redAccent,
                    titleStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: SizeConfig.safeBlockHorizontal * 6,
                      color: Colors.white,
                    ),
                    radius: 30,
                    //content
                    content: Column(
                      children: [
                        Text(
                          'All your Data and Progress will be permanently lost.',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.safeBlockHorizontal * 5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                //Write delete functon here
                                Get.back();
                                Get.defaultDialog(
                                  titlePadding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.safeBlockHorizontal * 5,
                                      vertical:
                                          SizeConfig.safeBlockVertical * 2),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.safeBlockHorizontal * 5,
                                      vertical:
                                          SizeConfig.safeBlockVertical * 1),
                                  title: "Please confirm your password.",
                                  middleText: '',
                                  backgroundColor: Colors.redAccent,
                                  titleStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 5,
                                    color: Colors.white,
                                  ),
                                  radius: 30,
                                  //content
                                  content: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                SizeConfig.safeBlockVertical *
                                                    2,
                                            horizontal:
                                                SizeConfig.safeBlockHorizontal *
                                                    5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2.0,
                                          ),
                                        ),
                                        child:
                                            UserDataPasswordInputConfirmation(
                                          textEditingController:
                                              passwordController,
                                          icon: Icons.key_outlined,
                                          label: 'Password',
                                          hintText: 'Type your password',
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () => Get.back(),
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: SizeConfig
                                                        .safeBlockHorizontal *
                                                    5,
                                                color: kDarkGrey,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              //Write delete functon here
                                              AuthController.instance
                                                  .verifyAccBeforeDelete(
                                                passwordController.text.trim(),
                                              );
                                            },
                                            child: Text(
                                              'Confirm',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: SizeConfig
                                                        .safeBlockHorizontal *
                                                    5,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                                  color: kDarkGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            //App restart required text
            SizedBox(
              height: SizeConfig.safeBlockVertical * 35,
            ),
            Text(
              'Note: Please restart the app to see any made changes.',
              style: kInteractionButtonsText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class AccountManagementButtons extends StatefulWidget {
  String? text;
  Function()? onTap;
  AccountManagementButtons({Key? key, this.text, this.onTap}) : super(key: key);

  @override
  State<AccountManagementButtons> createState() =>
      _AccountManagementButtonsState();
}

class _AccountManagementButtonsState extends State<AccountManagementButtons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text!,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
      onTap: widget.onTap,
    );
  }
}

class AccDeleteConfirmationDialog extends StatelessWidget {
  const AccDeleteConfirmationDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      title: Text(
        'Are you sure you want to Delete your Account?',
        style: kTitleStyles,
      ),
      content: Text(
        'All your Data and Progress will be permanently lost.',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: SizeConfig.safeBlockHorizontal * 5,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text(
            'Cancel',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: SizeConfig.safeBlockHorizontal * 6,
              color: Colors.black,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            //Write delete functon here
            AuthController.instance.deleteAcc(userInfo!.uid!);
            Navigator.pop(context);
          },
          child: Text(
            'Delete',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: SizeConfig.safeBlockHorizontal * 6,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

class UserDataPasswordInputConfirmation extends StatelessWidget {
  String? hintText, label;
  IconData? icon;
  TextEditingController? textEditingController;
  UserDataPasswordInputConfirmation({
    Key? key,
    required this.hintText,
    required this.label,
    required this.icon,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      onChanged: (value) {},
      controller: textEditingController,
      decoration: const InputDecoration.collapsed(
        hintText: 'Password',
      ),
    );
  }
}
