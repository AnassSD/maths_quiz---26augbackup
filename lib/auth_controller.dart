import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maths_quiz/account/profile.dart';
import 'package:maths_quiz/loadingPage.dart';
import 'package:maths_quiz/main.dart';
import 'package:maths_quiz/splashscreen.dart';
import 'package:maths_quiz/splashscreen2.dart';
import 'package:maths_quiz/startUpPages/SignInPage.dart';
import 'package:maths_quiz/startUpPages/welcomeLoginPage.dart';
import 'package:maths_quiz/startUpPages/welcomePage.dart';
import 'package:maths_quiz/verifyEmail.dart';

class AuthController extends GetxController {
  //AuthController.instance...
  static AuthController instance = Get.find();
  //email, password, name...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //the user will be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print('Login page');
      Get.offAll(
        () => SplashScreenPage2(),
        //() => LoadingAnimationPage(),
      );
    } else {
      Get.offAll(
        () => VerifyEmailPage(),
      );
    }
  }

  void register(String email, password, name, lastName) async {
    try {
      //create user
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        'About User',
        'User message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          'Account creation failed',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
    addUserDetails(name, lastName, email);
  }

  Future addUserDetails(String name, String lastName, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'firstName': name,
      'lastName': lastName,
      'email': email,
    });
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        'About Login',
        'Login message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          'Login failed',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
