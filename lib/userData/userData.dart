// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  final String uid;
  static String? firstName, lastName, username;
  UserData({required this.uid});
}

Future<void> setFirstNameData(firstnameValue) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('firstname', firstnameValue);
}

void getFirstNameData() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  UserData.firstName = pref.getString('firstname');
  //setState(() {});
}
