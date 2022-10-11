import 'package:flutter/material.dart';
import 'package:maths_quiz/authenticate/auth_controller.dart';
import 'package:maths_quiz/sizeConfig.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: StreamBuilder<List<Acc>>(
      stream: readUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something  went wrong! ${snapshot.error}');
        } else if (snapshot.hasData) {
          final users = snapshot.data!;
          return ListView(
            children: users.map(buildAcc).toList(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
