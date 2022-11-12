import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maths_quiz/ExercicesPages/exercicePage.dart';
import 'package:maths_quiz/ExercicesPages/quizBrain.dart';
import 'package:maths_quiz/account/AccountManagement.dart';
import 'package:maths_quiz/account/PublicProfilePage.dart';
import 'package:maths_quiz/authenticate/SignUpPage.dart';
import 'package:maths_quiz/authenticate/auth_controller.dart';
import 'package:maths_quiz/constants/constantsColors.dart';
import 'package:maths_quiz/constants/constantsTextStyles.dart';
import 'package:maths_quiz/sizeConfig.dart';
import 'package:maths_quiz/verifyEmail.dart';

//
// String firstName = userInfo!.firstname!,
//     lastName = userInfo!.lastname!,
//     email = userInfo!.email!;
String imageUrl = '';

//
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
//
  var passwordController = TextEditingController();
  PageController pageController = PageController(initialPage: 0);

  int currentIndex = 0;

  double containerWidth1 = SizeConfig.safeBlockHorizontal * 10,
      containerWidth2 = 0,
      containerWidth3 = 0;

  bool saved = false, profile = true;
//

  //
  void pushOrEditImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 320,
      maxWidth: 320,
      imageQuality: 50,
    );
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('user/profile/${AuthController.useruid}');

    try {
      await ref.putFile(File(image!.path));
      ref.getDownloadURL().then((value) {
        setState(() {
          imageUrl = value;
        });
      });
    } catch (e) {
      // ignore: avoid_print
      print(
        e.toString(),
      );
    }
  }
  //

  void getImage() async {
    try {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('user/profile/${AuthController.useruid}');
      await ref.getDownloadURL();
      ref.getDownloadURL().then((value) {
        setState(() {
          imageUrl = value;
        });
        // ignore: invalid_return_type_for_catch_error
      }).catchError((e) => {
            setState((() {
              imageUrl = '';
            }))
          });
    } catch (e) {
      // ignore: avoid_print
      print('file not found');
    }
  }

//

  @override
  Widget build(BuildContext context) {
    getImage();
    return Container(
      height: SizeConfig.safeBlockVertical * 92,
      padding: kColumnPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Profile Picture
            Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical * 6,
                bottom: SizeConfig.safeBlockVertical * 3,
              ),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 50,
                      width: SizeConfig.safeBlockHorizontal * 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageUrl == ''
                              ? const AssetImage('images/catDefaultAvatar.png')
                                  as ImageProvider
                              : NetworkImage(imageUrl),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: SizeConfig.safeBlockHorizontal * 2.5,
                      child: GestureDetector(
                        onTap: () {
                          pushOrEditImage();
                        },
                        child: Container(
                          height: SizeConfig.safeBlockHorizontal * 11,
                          width: SizeConfig.safeBlockHorizontal * 11,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: kGrey,
                          ),
                          child: Icon(
                            Icons.edit,
                            size: SizeConfig.safeBlockHorizontal * 6.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Name and email
            Padding(
              padding:
                  EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 3),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      '${userInfo!.firstname!} ${userInfo!.lastname!}',
                      style: kProfileNameTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '@${userInfo!.email!.substring(0, userInfo!.email!.indexOf('@'))}',
                      style: kInteractionButtonsText,
                    ),
                  ],
                ),
              ),
            ),
            //Profile Created Saved
            SizedBox(
              height: SizeConfig.safeBlockVertical * 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Profile
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 3),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Text(
                            'Profile',
                            style: kProfileFunctionKey,
                          ),
                          onTap: () {
                            setState(() {
                              if (containerWidth1 == 0) {
                                containerWidth1 =
                                    SizeConfig.safeBlockHorizontal * 10;
                              }
                              containerWidth2 = containerWidth3 = 0;
                              pageController.animateToPage(0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate);
                              profile = true;
                              saved = false;
                            });
                          },
                        ),
                        AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: kDarkGrey,
                          ),
                          duration: const Duration(
                            milliseconds: 250,
                          ),
                          width: containerWidth1,
                          child: SizedBox(
                            height: SizeConfig.safeBlockVertical * 0.6,
                            width: SizeConfig.safeBlockHorizontal * 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Created
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 3),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Text(
                            'Created',
                            style: kProfileFunctionKey,
                          ),
                          onTap: () {
                            setState(() {
                              if (containerWidth2 == 0) {
                                containerWidth2 =
                                    SizeConfig.safeBlockHorizontal * 14;
                              }
                              containerWidth1 = containerWidth3 = 0;
                              pageController.animateToPage(1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate);
                              profile = false;
                              saved = false;
                            });
                          },
                        ),
                        AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: kDarkGrey,
                          ),
                          duration: const Duration(
                            milliseconds: 250,
                          ),
                          width: containerWidth2,
                          child: SizedBox(
                            height: SizeConfig.safeBlockVertical * 0.6,
                            width: SizeConfig.safeBlockHorizontal * 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Saved
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 3),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Text(
                            'Saved',
                            style: kProfileFunctionKey,
                          ),
                          onTap: () {
                            setState(() {
                              if (containerWidth3 == 0) {
                                containerWidth3 =
                                    SizeConfig.safeBlockHorizontal * 9;
                              }
                              containerWidth1 = containerWidth2 = 0;
                              pageController.animateToPage(2,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate);
                              profile = false;
                              saved = true;
                            });
                          },
                        ),
                        AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: kDarkGrey,
                          ),
                          duration: const Duration(
                            milliseconds: 250,
                          ),
                          width: containerWidth3,
                          child: SizedBox(
                            height: SizeConfig.safeBlockVertical * 0.6,
                            width: SizeConfig.safeBlockHorizontal * 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Swipeable Content
            SizedBox(
              height: SizeConfig.safeBlockVertical * 30,
              child: PageView(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (page) {
                  setState(
                    () {
                      switch (page) {
                        case 0:
                          if (containerWidth1 == 0) {
                            containerWidth1 =
                                SizeConfig.safeBlockHorizontal * 10;
                          }
                          containerWidth2 = containerWidth3 = 0;
                          pageController.animateToPage(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.decelerate);
                          profile = false;
                          saved = false;
                          break;
                        case 1:
                          if (saved == false && profile == false) {
                            if (containerWidth2 == 0) {
                              containerWidth2 =
                                  SizeConfig.safeBlockHorizontal * 14;
                            }
                            containerWidth1 = containerWidth3 = 0;
                            pageController.animateToPage(1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.decelerate);
                          }

                          break;
                        case 2:
                          if (containerWidth3 == 0) {
                            containerWidth3 =
                                SizeConfig.safeBlockHorizontal * 9;
                          }
                          containerWidth1 = containerWidth2 = 0;
                          pageController.animateToPage(2,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.decelerate);
                          profile = false;
                          saved = false;
                          break;
                      }
                    },
                  );
                },
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 5,
                        vertical: SizeConfig.safeBlockVertical * 1.5),
                    child: Column(
                      children: [
                        //PublicProfile
                        ProfileButtons(
                          text: 'Public Profile',
                          onTap: () {
                            setState(() {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(
                                      SizeConfig.safeBlockHorizontal * 8),
                                )),
                                isScrollControlled: true,
                                context: context,
                                builder: (context) => const PublicProfilePage(),
                              );
                            });
                          },
                        ),
                        //Account management
                        ProfileButtons(
                          text: 'Account management',
                          onTap: () {
                            setState(() {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(
                                      SizeConfig.safeBlockHorizontal * 8),
                                )),
                                isScrollControlled: true,
                                context: context,
                                builder: (context) => const AccountManagement(),
                              );
                            });
                          },
                        ),
                        //Notifications
                        ProfileButtons(
                          text: 'Notifications',
                          onTap: () {},
                        ),
                        //LogOutbutton
                        ProfileActionButtons(
                          text: 'Log out',
                          onTap: () {
                            AuthController.instance.logOut();
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Comming Soon!',
                      style: kAwnserCardText,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Comming Soon!',
                      style: kAwnserCardText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProfileButtons extends StatefulWidget {
  String? text;
  Function()? onTap;
  ProfileButtons({Key? key, this.text, this.onTap}) : super(key: key);

  @override
  State<ProfileButtons> createState() => _ProfileButtonsState();
}

class _ProfileButtonsState extends State<ProfileButtons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 0.5),
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text!,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                ),
              ),
              FaIcon(
                FontAwesomeIcons.angleRight,
                size: SizeConfig.safeBlockHorizontal * 6,
              ),
            ],
          ),
        ),
      ),
      onTap: widget.onTap,
    );
  }
}

// ignore: must_be_immutable
class ProfileActionButtons extends StatefulWidget {
  String? text;
  Function()? onTap;
  ProfileActionButtons({Key? key, this.text, this.onTap}) : super(key: key);

  @override
  State<ProfileActionButtons> createState() => _ProfileActionButtonsState();
}

class _ProfileActionButtonsState extends State<ProfileActionButtons> {
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
                fontSize: SizeConfig.safeBlockHorizontal * 5,
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

// ignore: must_be_immutable
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
