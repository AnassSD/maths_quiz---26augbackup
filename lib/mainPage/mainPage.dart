import 'package:flutter/material.dart';
import 'package:maths_quiz/ExercicesPages/exercicesBox.dart';
import 'package:maths_quiz/constants/constantsTextStyles.dart';
import 'package:maths_quiz/mainPage/src/PopularExercices/WidgetCouple.dart';
import '../bottomBar.dart';
import '../sizeConfig.dart';
import 'src/greatingUserName.dart';
import 'src/motivationalQuote.dart';
import 'src/underTitles.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical * 92,
      padding: kColumnPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // HeadText Hi, UserName.
            GreatingUserName(),
            // Math quote
            MotivationalQuote(),
            // Popular Exercices and its widgets
            UnderTitles(
              text: 'Popular exercices',
              soustext: 'See all',
              root: '/exercicesList',
            ),
            Column(
              children: [
                WidgetCouple(
                  root1: '/exercice',
                  root2: '/exercice1',
                  image1: '8year.png',
                  text1: 'Numbers',
                  image2: '10year.png',
                  text2: 'Fois et Division',
                ),
                WidgetCouple(
                  root1: '/exercice',
                  root2: '/exercice',
                  image1: '12year.png',
                  text1: 'Addition & Subtraction',
                  image2: '14year.png',
                  text2: 'Percentage',
                ),
              ],
            ),
            // Cognitive videos and videos
            UnderTitles(
              text: 'Weekly exercices',
              soustext: ' ',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ExercicesBox(
                  text: 'Number',
                  root: '/exercice',
                ),
                ExercicesBox(
                  text: 'Number',
                  root: '/exercice',
                ),
              ],
            ),

            // Empty Space
            SizedBox(
              height: SizeConfig.safeBlockVertical * 3,
            ),
          ],
        ),
      ),
    );
  }
}
