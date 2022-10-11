import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maths_quiz/splashscreen2.dart';
import 'package:maths_quiz/userData/userData.dart';
import 'package:maths_quiz/verifyEmail.dart';

class AuthController extends GetxController {
  String? useruid;
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
      //go to welcome page
      Get.offAll(
        () => const SplashScreenPage2(),
      );
    } else {
      //go to verify page if not verified else go to Home page if verified
      _userFromFirebaseUser(user);
      Get.offAll(
        () => const VerifyEmailPage(),
      );
    }
  }

  void register(String email, password, name, lastName) async {
    try {
      //create user
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //
      useruid = auth.currentUser!.uid;
      Get.snackbar(
        'About User',
        'User message',
        backgroundColor: Colors.greenAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Account created succesfully',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: const Text(
          "Your account have been created it, please continue to activate it.",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
    // if the user could not be created
    catch (e) {
      Get.snackbar(
        'About User',
        'User message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Account creation failed',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
    addUserDetails(
      name,
      lastName,
      email,
      useruid!,
    );
  }

  void login(String email, password) async {
    // log in
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      // after log in
      Get.snackbar(
        'About Login',
        'Login message',
        backgroundColor: Colors.greenAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Logged In succesfully',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: const Text(
          "Welcome back.",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
    // if the user could not log in
    catch (e) {
      Get.snackbar(
        'About Login',
        'Login message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Login failed',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void logOut() async {
    await auth.signOut();
    Get.snackbar(
      'About User',
      'Log out message',
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: const Text(
        'Logged out',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      messageText: const Text(
        "You have logged out from your recent account. Please re-SignIn to reaccess it.",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Future addUserDetails(
      String name, String lastName, String email, String uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'firstName': name,
      'lastName': lastName,
      'email': email,
      'uid': uid,
    });
  }

  UserData? _userFromFirebaseUser(User? user) {
    return UserData(uid: user!.uid);
  }
}
