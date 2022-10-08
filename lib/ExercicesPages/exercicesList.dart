// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:maths_quiz/ExercicesPages/exercicesBox.dart';

import '../constants/constantsTextStyles.dart';
import '../sizeConfig.dart';

class ExercicesList extends StatefulWidget {
  const ExercicesList({Key? key}) : super(key: key);

  @override
  State<ExercicesList> createState() => _ExercicesListState();
}

class _ExercicesListState extends State<ExercicesList> {
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
            // Container(
            //   margin:
            //       EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 2),
            //   child: GestureDetector(
            //     child: Icon(
            //       Icons.sort_rounded,
            //       size: SizeConfig.safeBlockHorizontal * 7,
            //     ),
            //     //Sort Function
            //     onTap: () {
            //       setState(() {});
            //     },
            //   ),
            // ),
          ],
        ),
        //   actions: [
        //     Theme(
        //       data: Theme.of(context).copyWith(
        //         dividerTheme: DividerThemeData(
        //           color: Colors.black,
        //         ),
        //       ),
        //       child: PopupMenuButton(
        //         color: Colors.white,
        //         position: PopupMenuPosition.under,
        //         shape: RoundedRectangleBorder(
        //           borderRadius:
        //               BorderRadius.circular(SizeConfig.safeBlockHorizontal * 5),
        //         ),
        //         padding:
        //             EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 4),
        //         icon: Icon(
        //           Icons.sort_rounded,
        //           size: SizeConfig.safeBlockHorizontal * 7,
        //         ),
        //         itemBuilder: (context) => [
        //           PopupMenuItem(
        //             value: 0,
        //             child: Text('Test'),
        //           ),
        //           PopupMenuDivider()
        //           PopupMenuItem(
        //             value: 1,
        //             child: Text('Test'),
        //           ),
        //         ],
        //       ),
        //     )
        //     // SortBy menu

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
                //TODO: Finish the filter section
                //TODO: Make Search work
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Heading
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     'Exercices',
                  //     style: kTitleStyles,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: SizeConfig.safeBlockVertical * 5,
                  //   child: Container(),
                  // ),

                  ///
                  ///

                  ExercicesBox(
                    text: 'Number',
                    root: '/exercice',
                  ),
                  ExercicesBox(
                    text: 'Number1',
                    root: '/exercice1',
                  ),
                  ExercicesBox(
                    text: 'Number',
                    root: '/exercice',
                  ),
                  ExercicesBox(
                    text: 'Number1',
                    root: '/exercice1',
                  ),
                  ExercicesBox(
                    text: 'Number',
                    root: '/exercice',
                  ),
                  ExercicesBox(
                    text: 'Number1',
                    root: '/exercice1',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
