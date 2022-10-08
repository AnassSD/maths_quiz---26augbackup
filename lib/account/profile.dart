import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maths_quiz/account/PublicProfilePage.dart';
import 'package:maths_quiz/authenticate/auth_controller.dart';
import 'package:maths_quiz/constants/constantsColors.dart';
import 'package:maths_quiz/constants/constantsTextStyles.dart';
import 'package:maths_quiz/sizeConfig.dart';

//
String firstName = 'Anas', lastName = 'Said', username = 'saidanas789';

//
class Profile extends StatefulWidget {
  static String? firstName, lastName, username;

  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  double containerWidth1 = SizeConfig.safeBlockHorizontal * 10,
      containerWidth2 = 0,
      containerWidth3 = 0;
  bool saved = false, profile = true;
//
  @override
  Widget build(BuildContext context) {
    Profile.firstName = firstName;
    Profile.lastName = lastName;
    Profile.username = username;
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
              child: CircleAvatar(
                backgroundColor: kViolet,
                radius: SizeConfig.safeBlockHorizontal * 25,
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
                      '$firstName $lastName',
                      style: kProfileNameTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '@$username',
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
                        vertical: SizeConfig.safeBlockVertical * 3),
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
                        ProfileButtons(
                          text: 'Personal information',
                          onTap: () {},
                        ),
                        ProfileButtons(
                          text: 'Account management',
                          onTap: () {},
                        ),
                        ProfileButtons(
                          text: 'Notifications',
                          onTap: () {},
                        ),
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


//TODO:  save data like name and age and photo, store exercices data on server 