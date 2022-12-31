// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:maths_quiz/ExercicesMainPage/mainExercicesLessons.dart';
import 'package:maths_quiz/questions/content.dart';
import 'package:maths_quiz/questions/questions.dart';
import '../constants/constantsTextStyles.dart';
import '../sizeConfig.dart';

// ignore: must_be_immutable
class ExercicesPage extends StatefulWidget {
  Questions questionsObjct;
  ExercicesPage(this.questionsObjct, {Key? key}) : super(key: key);

  @override
  State<ExercicesPage> createState() => _ExercicesPageState();
}

class _ExercicesPageState extends State<ExercicesPage> {
  @override
  Widget build(BuildContext context) {
    Questions questions = widget.questionsObjct;
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
          width: SizeConfig.safeBlockHorizontal * 100,
          height: SizeConfig.safeBlockVertical * 100,
          padding: kColumnPadding,
          color: Colors.white,
          child: Expanded(
            child: ListView.builder(
              itemCount: questions.question.length,
              itemBuilder: (context, index) =>
                  MainExerciceLessonWidget(questions: questions, index: index),
            ),
          ),
        ),
      ),
    );
  }
}

class MainExerciceLessonWidget extends StatelessWidget {
  const MainExerciceLessonWidget({
    Key? key,
    required this.questions,
    required this.index,
  }) : super(key: key);

  final Questions questions;
  final int index;

  @override
  Widget build(BuildContext context) {
    Content lesson = questions.question[index];
    return GestureDetector(
      onTap: () {
        Get.to(
          () => MainExercicesLessons(lesson: lesson),
          transition: Transition.cupertino,
        );
      },
      child: Container(
        height: SizeConfig.safeBlockVertical * 24,
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 6),
        margin:
            EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 1.5),
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('images/$image'),
            //   fit: BoxFit.fill,
            // ),
            borderRadius:
                BorderRadius.circular(SizeConfig.safeBlockHorizontal * 8),
            color: const Color.fromARGB(255, 236, 151, 144)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                questions.question[index].age,
                style: kLessonAge,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  questions.question[index].title,
                  style: kLessonTitle,
                ),
                FaIcon(
                  FontAwesomeIcons.angleRight,
                  size: SizeConfig.safeBlockHorizontal * 6,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
