// ignore_for_file: file_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maths_quiz/authenticate/auth_controller.dart';
import 'package:maths_quiz/constants/constantsColors.dart';
import 'package:maths_quiz/constants/constantsTextStyles.dart';
import 'package:maths_quiz/sizeConfig.dart';
import 'package:maths_quiz/verifyEmail.dart';

//First name
bool firstNameIsEditingText = false;
late TextEditingController firstNameEditingController;
String initialFirstName = userInfo!.firstname!;

//

//Last name
bool lastNameIsEditingText = false;
late TextEditingController lastNameEditingController;
String initialLastName = userInfo!.lastname!;

//
class PublicProfilePage extends StatefulWidget {
  const PublicProfilePage({Key? key}) : super(key: key);

  @override
  State<PublicProfilePage> createState() => _PublicProfilePageState();
}

class _PublicProfilePageState extends State<PublicProfilePage> {
  @override
  void initState() {
    super.initState();
    //Firstname
    firstNameEditingController = TextEditingController(text: initialFirstName);
    //LastName
    lastNameEditingController = TextEditingController(text: initialLastName);
  }

  @override
  void dispose() {
    //FirstName
    firstNameEditingController.dispose();
    //LastName
    lastNameEditingController.dispose();
    super.dispose();
  }

  Widget editFirstName() {
    if (firstNameIsEditingText) {
      return Center(
          child: Theme(
        data: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: kViolet,
            selectionColor: kViolet,
            cursorColor: kViolet,
          ),
        ),
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(AuthController.useruid)
                  .update({'firstName': newValue});
              initialFirstName = newValue;
              firstNameIsEditingText = false;
            });
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: SizeConfig.safeBlockHorizontal * 5.5,
          ),
          cursorColor: kViolet,
          cursorRadius: const Radius.circular(5),
          autofocus: true,
          controller: firstNameEditingController,
        ),
      ));
    }
    return InkWell(
      onTap: () {
        setState(() {
          firstNameIsEditingText = true;
        });
      },
      child: Text(
        initialFirstName,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: SizeConfig.safeBlockHorizontal * 5.5,
        ),
      ),
    );
  }

  Widget editLastName() {
    if (lastNameIsEditingText) {
      return Center(
          child: Theme(
        data: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: kViolet,
            selectionColor: kViolet,
            cursorColor: kViolet,
          ),
        ),
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(AuthController.useruid)
                  .update({'lastName': newValue});
              initialLastName = newValue;
              lastNameIsEditingText = false;
            });
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: SizeConfig.safeBlockHorizontal * 5.5,
          ),
          cursorColor: kViolet,
          cursorRadius: const Radius.circular(5),
          autofocus: true,
          controller: lastNameEditingController,
        ),
      ));
    }
    return InkWell(
      onTap: () {
        setState(() {
          lastNameIsEditingText = true;
        });
      },
      child: Text(
        initialLastName,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: SizeConfig.safeBlockHorizontal * 5.5,
        ),
      ),
    );
  }

  String imageUrl = '';

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
        " THE ERROR IS : ${e.toString()}",
      );
    }
  }

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
            //Profile pic changing
            GestureDetector(
              onTap: () {
                pushOrEditImage();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 2),
                child: Text(
                  'Change profile picture',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                  ),
                ),
              ),
            ),
            //Change first name
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First name',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                    ),
                  ),
                  editFirstName(),
                ],
              ),
            ),
            //change last name
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last name',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                    ),
                  ),
                  editLastName(),
                ],
              ),
            ),
            //App restart required text
            SizedBox(
              height: SizeConfig.safeBlockVertical * 30,
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
