// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class User {
  static String? firstName, lastName, username;
}


  Future<void> setFirstNameData(firstnameValue) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('firstname', firstnameValue);
  }

  void getFirstNameData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    User.firstName = pref.getString('firstname');
    //setState(() {});
  }