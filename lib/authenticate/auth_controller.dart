import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maths_quiz/splashscreen2.dart';
import '../verifyEmail.dart';

class AuthController extends GetxController {
  static String? useruid;
  static bool canResetPassword = false;
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
      useruid = auth.currentUser!.uid;
      //go to verify page if not verified else go to Home page if verified
      Get.offAll(
        () => const VerifyEmailPage(),
      );
    }
  }

  void register(
      String email, String password, String name, String lastName) async {
    if (name.replaceAll(' ', '') != '' && lastName.replaceAll(' ', '') != '') {
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
        addUserDetails(
          name: name,
          lastname: lastName,
          email: email,
          uid: useruid!,
          score: 0,
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
    } else {
      Get.snackbar(
        'About name and lastname',
        'User message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Account creation failed',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: const Text(
          'Please enter both of your name and lastname to create your account.',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void verifyAccBeforePasswordReset(String password) async {
    try {
      await auth.currentUser
          ?.reauthenticateWithCredential(EmailAuthProvider.credential(
        email: userInfo!.email!,
        password: password,
      ));
      resetPassword(userInfo!.email!.trim());
    } catch (e) {
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

  void verifyAccBeforeDelete(String password) async {
    try {
      await auth.currentUser
          ?.reauthenticateWithCredential(EmailAuthProvider.credential(
        email: userInfo!.email!,
        password: password,
      ));
      deleteAcc(userInfo!.uid!);
    } catch (e) {
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

  void deleteAcc(String uid) async {
    //delete profile pic
    try {
      await FirebaseStorage.instance.ref().child('user/profile/$uid').delete();
      // Get.snackbar(
      //   'About User',
      //   'User message',
      //   backgroundColor: Colors.redAccent,
      //   snackPosition: SnackPosition.BOTTOM,
      //   titleText: const Text(
      //     'Account Deleted successfully.',
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      //   messageText: const Text(
      //     'Account no longer exists, all data are lost.',
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      // );
    } catch (e) {
      // Get.snackbar(
      //   'About User',
      //   'User message',
      //   backgroundColor: Colors.redAccent,
      //   snackPosition: SnackPosition.BOTTOM,
      //   titleText: const Text(
      //     'Account Delete failed.',
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      //   messageText: Text(
      //     e.toString(),
      //     style: const TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      // );
    }

    ///
    /// Delete document
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).delete();
    } catch (e) {
      // Get.snackbar(
      //   'About User',
      //   'User message',
      //   backgroundColor: Colors.redAccent,
      //   snackPosition: SnackPosition.BOTTOM,
      //   titleText: const Text(
      //     'Account Delete failed.',
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      //   messageText: Text(
      //     e.toString(),
      //     style: const TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      // );
    }
    // //  Delete current account
    try {
      await FirebaseAuth.instance.currentUser!.delete();
      Get.snackbar(
        'About User',
        'User message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Account Deleted successfully.',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: const Text(
          'Account no longer exists, all data are lost.',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    } catch (e) {
      Get.snackbar(
        'About User',
        'User message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Account Delete failed.',
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
          "Welcome back!",
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

  Future resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.back();
      Get.snackbar(
        'About password',
        'Password reset message',
        backgroundColor: Colors.greenAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Reset Email sent.',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          "Password Reset email has been sent to $email, please follow the email instractions to reset your password.",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
      await Future.delayed(const Duration(seconds: 5));
    } catch (e) {
      Get.snackbar(
        'About password',
        'Password reset message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Email not found.',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: const Text(
          'Please provide an existing email adress.',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  Future resetPasswordWithoutPop(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.back();
      Get.snackbar(
        'About password',
        'Password reset message',
        backgroundColor: Colors.greenAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Reset Email sent.',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          "Password Reset email has been sent to $email, please follow the email instractions to reset your password.",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
      await Future.delayed(const Duration(seconds: 5));
    } catch (e) {
      Get.snackbar(
        'About password',
        'Password reset message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Email not found.',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: const Text(
          'Please provide an existing email adress.',
          style: TextStyle(
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
      {required String name,
      required String lastname,
      required String email,
      required String uid,
      required int score}) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'firstName': name.capitalize,
      'lastName': lastname.capitalize,
      'email': email,
      'uid': uid,
      'score': score,
    });
  }
}

class Acc {
  String? email, firstname, lastname, uid;
  int? score;
  Acc({
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.uid,
    required this.score,
  });
  static Acc fromJson(Map<String, dynamic> json) => Acc(
        email: json['email'],
        firstname: json['firstName'],
        lastname: json['lastName'],
        uid: json['uid'],
        score: json['score'],
      );
}

//For all accounts
Stream<List<Acc>> readUsers() =>
    FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Acc.fromJson(doc.data())).toList());

//
//For one Account
Future<Acc?> readUser() async {
  final docUser = FirebaseFirestore.instance
      .collection('users')
      .doc(AuthController.useruid);
  final snapshot = await docUser.get();

  if (snapshot.exists) {
    return Acc.fromJson(snapshot.data()!);
  }
  return null;
}

Widget buildAcc(Acc user) => ListTile(
      title: Text('${user.email}'),
      subtitle: Column(children: [
        Text('${user.firstname}'),
        Text('${user.lastname}'),
        Text('${user.uid}'),
        Text('score: ${user.score}'),
      ]),
    );
