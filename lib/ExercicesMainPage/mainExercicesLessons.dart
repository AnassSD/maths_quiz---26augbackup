import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:maths_quiz/ExercicesMainPage/quizPage.dart';
import 'package:maths_quiz/constants/constantsTextStyles.dart';
import 'package:maths_quiz/questions/content.dart';

import '../sizeConfig.dart';

class MainExercicesLessons extends StatefulWidget {
  const MainExercicesLessons({Key? key, required this.lesson})
      : super(key: key);
  final Content lesson;

  @override
  State<MainExercicesLessons> createState() => _MainExercicesLessonsState();
}

class _MainExercicesLessonsState extends State<MainExercicesLessons> {
  @override
  Widget build(BuildContext context) {
    Content lesson = widget.lesson;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Center(
              child: FaIcon(
            FontAwesomeIcons.angleLeft,
            size: SizeConfig.safeBlockHorizontal * 8,
          )),
          onTap: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              lesson.title,
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
                itemCount: lesson.lessons.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => QuizPage(),
                      );
                    },
                    child: Container(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${lesson.lessons[index].score}',
                                style: kScoreNumber,
                              ),
                              Text(
                                'pt',
                                style: kScorePoint,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                lesson.lessons[index].lessonTitle,
                                style: kLessonTitle,
                              ),
                              Text(
                                lesson.lessons[index].difficulty,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
