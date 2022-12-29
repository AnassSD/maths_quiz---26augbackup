// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maths_quiz/ExercicesPages/exercicesBox.dart';
import '../constants/constantsTextStyles.dart';
import '../sizeConfig.dart';

class ExercicesPage extends StatefulWidget {
  const ExercicesPage({Key? key}) : super(key: key);

  @override
  State<ExercicesPage> createState() => _ExercicesPageState();
}

class _ExercicesPageState extends State<ExercicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Exercices',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: SizeConfig.safeBlockHorizontal * 9.5,
              ),
            ),
          ],
        ),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerTheme: const DividerThemeData(
                color: Colors.grey,
              ),
            ),
            child: PopupMenuButton<int>(
              color: Colors.white,
              position: PopupMenuPosition.under,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockHorizontal * 5),
              ),
              padding:
                  EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 4),
              icon: Icon(
                Icons.sort_rounded,
                size: SizeConfig.safeBlockHorizontal * 7,
              ),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  child: Text(
                    "Sort by",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  enabled: false,
                ),
                const PopupMenuDivider(),
                const PopupMenuItem(
                  child: Text('Age'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: SizeConfig.safeBlockVertical * 100,
          padding: kColumnPadding,
          child: Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('exercices')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => Container(
                      // width: SizeConfig.safeBlockHorizontal*92,
                      height: SizeConfig.safeBlockVertical * 24,
                      padding:
                          EdgeInsets.all(SizeConfig.safeBlockHorizontal * 6),
                      margin: EdgeInsets.symmetric(
                          vertical: SizeConfig.safeBlockVertical * 1.5),
                      decoration: BoxDecoration(
                          // image: DecorationImage(
                          //   image: AssetImage('images/$image'),
                          //   fit: BoxFit.fill,
                          // ),
                          borderRadius: BorderRadius.circular(
                              SizeConfig.safeBlockHorizontal * 8),
                          color: const Color.fromARGB(255, 236, 151, 144)),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          snapshot.data!.docs[index]['title'],
                          style: kWidgetTitleStyles,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
