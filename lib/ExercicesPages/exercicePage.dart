import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maths_quiz/ExercicesPages/quizBrain.dart';
import 'package:maths_quiz/constants/constantsColors.dart';
import 'package:maths_quiz/constants/constantsTextStyles.dart';
import 'package:maths_quiz/sizeConfig.dart';
import 'package:audioplayers/audioplayers.dart';
import 'quizBrain.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:percent_indicator/percent_indicator.dart';

const kGreyShadowColor = Color.fromARGB(255, 224, 219, 218);
QuizBrain quiz = QuizBrain();
String buttonLabel = 'Check';

class Exercices extends StatefulWidget {
  int? pageNumber;
  Exercices(this.pageNumber);
  @override
  State<Exercices> createState() => _ExercicesState();
}

int questionNumber = 0, questionIndex = 0, selected = 0;
int trueAnswers = 0, falseAnswers = 0;
int livesNumber = 5;
Color c1 = Colors.white,
    c2 = Colors.white,
    c3 = Colors.white,
    c4 = Colors.white;
Color shadowColor1 = kGreyShadowColor,
    shadowColor2 = kGreyShadowColor,
    shadowColor3 = kGreyShadowColor,
    shadowColor4 = kGreyShadowColor;
double shadowVerticalBlur1 = 2,
    shadowVerticalBlur2 = 2,
    shadowVerticalBlur3 = 2,
    shadowVerticalBlur4 = 2;
bool next = false;
int listSize = 0;

class _ExercicesState extends State<Exercices> {
  @override
  Widget build(BuildContext context) {
    int? pageIndex = widget.pageNumber;
    listSize = quiz.pages[pageIndex!].length;
    //
    String? question = quiz.pages[pageIndex][questionNumber].questionText,
        awnser1 = quiz.pages[pageIndex][questionNumber].awnser1,
        awnser2 = quiz.pages[pageIndex][questionNumber].awnser2,
        awnser3 = quiz.pages[pageIndex][questionNumber].awnser3,
        awnser4 = quiz.pages[pageIndex][questionNumber].awnser4;
    int? rightAwnser = quiz.pages[pageIndex][questionNumber].rightIndex;
    //
    final player = AudioCache();
    //
    Future<int> resultSync() async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => ResultPage(),
      );
      await neutralize();
      return 0;
    }
    //

    //When the questions end
    if (questionNumber >= listSize) {}
    return Scaffold(
      backgroundColor: kLightViolet,
      body: SafeArea(
        child: Column(
          children: [
            // Exit, Progress, hearts left place
            ExercicesPageHeading(),
            // Questions widget
            Container(
              height: SizeConfig.safeBlockVertical * 92,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/math.png"),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeConfig.safeBlockHorizontal * 10),
                  topRight:
                      Radius.circular(SizeConfig.safeBlockHorizontal * 10),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  SizeConfig.safeBlockHorizontal * 5,
                ),
                child: Column(
                  //
                  // crossAxisAlignment: CrossAxisAlignment.stretch,s
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //
                    // question
                    TeXView(
                      renderingEngine: const TeXViewRenderingEngine.mathjax(),
                      fonts: const [
                        TeXViewFont(
                            fontFamily: 'OpenSans',
                            src: 'fonts/OpenSans-ExtraBold.ttf'),
                      ],
                      child: TeXViewDocument(
                        question!,
                        style: TeXViewStyle(
                          fontStyle: TeXViewFontStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: TeXViewFontWeight.w800,
                            fontSize:
                                (SizeConfig.safeBlockHorizontal * 6.5).toInt(),
                          ),
                        ),
                      ),
                    ),

                    // Awnsers card
                    // You just have 3 Choices
                    Column(
                      children: [
                        // Awnser 1
                        GestureDetector(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: Math.tex(
                                  awnser1!,
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 5),
                                ),
                                // child: Text(
                                //   awnser1!,
                                //   style: kAwnserCardText,
                                // ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: c1,
                              boxShadow: [
                                //background color of box
                                BoxShadow(
                                  color: shadowColor1,
                                  blurRadius: 3, // soften the shadow
                                  spreadRadius: 1.0, //extend the shadow
                                  offset: Offset(
                                    0, // Move to right 10  horizontally
                                    shadowVerticalBlur1, // Move to bottom 10 Vertically
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 7),
                          ),
                          onTap: () {
                            setState(() {
                              if (next == false) {
                                //
                                shadowColor1 = Colors.grey;
                                shadowColor2 = shadowColor3 =
                                    shadowColor4 = kGreyShadowColor;
                                shadowVerticalBlur1 = 5;
                                shadowVerticalBlur2 = shadowVerticalBlur3 =
                                    shadowVerticalBlur4 = 2;
                                selected = 1;
                              }
                            });
                          },
                        ),
                        // Awnser 2
                        GestureDetector(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: Math.tex(
                                  awnser2!,
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 5),
                                ),
                                // child: Text(
                                //   awnser2!,
                                //   style: kAwnserCardText,
                                // ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: c2,
                              boxShadow: [
                                //background color of box
                                BoxShadow(
                                  color: shadowColor2,
                                  blurRadius: 1, // soften the shadow
                                  spreadRadius: 1.0, //extend the shadow
                                  offset: Offset(
                                    0, // Move to right 10  horizontally
                                    shadowVerticalBlur2, // Move to bottom 10 Vertically
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 7),
                          ),
                          onTap: () {
                            setState(() {
                              if (next == false) {
                                shadowColor2 = Colors.grey;
                                shadowColor1 = shadowColor3 =
                                    shadowColor4 = kGreyShadowColor;
                                shadowVerticalBlur2 = 5;
                                shadowVerticalBlur1 = shadowVerticalBlur3 =
                                    shadowVerticalBlur4 = 2;
                                selected = 2;
                              }
                            });
                          },
                        ),
                        // Awnser 3
                        GestureDetector(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: Math.tex(
                                  awnser3!,
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 5),
                                ),
                                // child: Text(
                                //   awnser3!,
                                //   style: kAwnserCardText,
                                // ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: c3,
                              boxShadow: [
                                //background color of box
                                BoxShadow(
                                  color: shadowColor3,
                                  blurRadius: 3, // soften the shadow
                                  spreadRadius: 1.0, //extend the shadow
                                  offset: Offset(
                                    0, // Move to right 10  horizontally
                                    shadowVerticalBlur3, // Move to bottom 10 Vertically
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 7),
                          ),
                          onTap: () {
                            setState(() {
                              if (next == false) {
                                shadowColor3 = Colors.grey;
                                shadowColor1 = shadowColor2 = kGreyShadowColor;
                                shadowVerticalBlur3 = 5;
                                shadowVerticalBlur1 = shadowVerticalBlur2 =
                                    shadowVerticalBlur4 = 2;
                                selected = 3;
                              }
                            });
                          },
                        ),
                        // Awnser 4
                        GestureDetector(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: Math.tex(
                                  awnser4!,
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 5),
                                ),
                                // child: Text(
                                //   awnser3!,
                                //   style: kAwnserCardText,
                                // ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: c4,
                              boxShadow: [
                                //background color of box
                                BoxShadow(
                                  color: shadowColor4,
                                  blurRadius: 3, // soften the shadow
                                  spreadRadius: 1.0, //extend the shadow
                                  offset: Offset(
                                    0, // Move to right 10  horizontally
                                    shadowVerticalBlur4, // Move to bottom 10 Vertically
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 7),
                          ),
                          onTap: () {
                            setState(() {
                              if (next == false) {
                                shadowColor4 = Colors.grey;
                                shadowColor1 = shadowColor2 =
                                    shadowColor3 = kGreyShadowColor;
                                shadowVerticalBlur4 = 5;
                                shadowVerticalBlur1 = shadowVerticalBlur2 =
                                    shadowVerticalBlur3 = 2;
                                selected = 4;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    //
                    // Next/check
                    // NextButtonWidget(),
                    GestureDetector(
                      child: Container(
                        width: SizeConfig.safeBlockHorizontal * 50,
                        padding:
                            EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.safeBlockHorizontal * 3),
                            color: Color.fromARGB(255, 234, 230, 253)),
                        child: Text(
                          buttonLabel,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: SizeConfig.safeBlockHorizontal * 5,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(
                          () {
                            //when next is pressed
                            if (next == true) {
                              if (questionNumber < listSize - 1) {
                                if (selected != 0) {
                                  questionNumber++;
                                }
                                if (livesNumber == 0) {
                                  resultSync();
                                }
                              } else if (questionNumber == listSize - 1) {
                                resultSync();
                              }
                              nextQuestionInitialisation();
                            }
                            //when check is pressed
                            else if (selected != 0) {
                              shadowColor1 = shadowColor2 = shadowColor3 =
                                  shadowColor4 = kGreyShadowColor;
                              if (selected == rightAwnser) {
                                //what to do if it's right answer
                                switch (selected) {
                                  case 1:
                                    c1 = Colors.greenAccent;
                                    break;
                                  case 2:
                                    c2 = Colors.greenAccent;
                                    break;
                                  case 3:
                                    c3 = Colors.greenAccent;
                                    break;
                                  case 4:
                                    c4 = Colors.greenAccent;
                                    break;

                                  default:
                                }
                                trueAnswers++;
                                player.play('CorrectAnswerSound.mp3');
                                print('Correct');
                              } else {
                                //what to do if it's wrong answer
                                switch (selected) {
                                  case 1:
                                    c1 = Colors.redAccent;
                                    break;
                                  case 2:
                                    c2 = Colors.redAccent;
                                    break;
                                  case 3:
                                    c3 = Colors.redAccent;
                                    break;
                                  case 4:
                                    c4 = Colors.redAccent;
                                    break;

                                  default:
                                }
                                falseAnswers++;
                                player.play('WrongAnswerSound.mp3');
                                print('Wrong');
                                if (livesNumber > 0) livesNumber--;
                              }
                              next = true;
                              buttonLabel = 'Next';
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExercicesPageHeading extends StatefulWidget {
  const ExercicesPageHeading({Key? key}) : super(key: key);

  @override
  State<ExercicesPageHeading> createState() => _ExercicesPageHeadingState();
}

class _ExercicesPageHeadingState extends State<ExercicesPageHeading> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        // show the confirm dialog
        await showDialog(
          context: context,
          builder: (_) => ConfirmationDialog(),
        );
        return willLeave;
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 5,
        ),
        height: SizeConfig.safeBlockVertical * 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            //
            //Back/Exit Button with Icon
            GestureDetector(
              onTap: () {
                neutralize();
                showDialog(
                  context: context,
                  builder: (BuildContext context) => ConfirmationDialog(),
                );
              },
              child: FaIcon(
                FontAwesomeIcons.angleLeft,
                color: Color.fromARGB(255, 0, 0, 0),
                size: SizeConfig.safeBlockHorizontal * 8,
              ),
            ),
            //
            //Question number
            LinearPercentIndicator(
              width: SizeConfig.safeBlockHorizontal * 50,
              lineHeight: SizeConfig.safeBlockVertical * 1.5,
              backgroundColor: kLightGrey,
              progressColor: Colors.black,
              barRadius: Radius.circular(SizeConfig.safeBlockHorizontal * 2),
              percent: questionNumber / listSize,
            ),
            //
            // Lives Number and Icon
            Row(
              children: [
                Icon(
                  CupertinoIcons.heart_fill,
                  size: SizeConfig.safeBlockHorizontal * 6.5,
                ),
                Text(
                  '$livesNumber', // heart number
                  style: kTitleStyles,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      title: Text(
        'Are you sure?',
        style: kTitleStyles,
      ),
      content: Text(
        'All your progress will be lost.',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: SizeConfig.safeBlockHorizontal * 5,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text(
            'Cancel',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: SizeConfig.safeBlockHorizontal * 6,
              color: Colors.black,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            int count = 0;
            Navigator.of(context).popUntil((context) => count++ >= 2);
          },
          child: Text(
            'Quit',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: SizeConfig.safeBlockHorizontal * 6,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      title: Text(
        'Your Results:',
        style: kTitleStyles,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$trueAnswers Correct answers',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: SizeConfig.safeBlockHorizontal * 6,
            ),
          ),
          Text(
            '$falseAnswers Wrong answers',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: SizeConfig.safeBlockHorizontal * 6,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        // TextButton(
        //   onPressed: () => Navigator.pop(context, 'Cancel'),
        //   child: Text(
        //     'Cancel',
        //     style: TextStyle(
        //       fontWeight: FontWeight.w800,
        //       fontSize: SizeConfig.safeBlockHorizontal * 6,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
        TextButton(
          onPressed: () async {
            int count = 0;
            Navigator.of(context).popUntil((context) => count++ >= 2);
          },
          child: Text(
            'Quit',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: SizeConfig.safeBlockHorizontal * 6,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

void nextQuestionInitialisation() {
  buttonLabel = 'Check';
  selected = 0;
  c1 = c2 = c3 = c4 = Colors.white;
  shadowColor1 = shadowColor2 = shadowColor3 = shadowColor4 = kGreyShadowColor;
  shadowVerticalBlur1 =
      shadowVerticalBlur2 = shadowVerticalBlur3 = shadowVerticalBlur4 = 2;
  next = false;
}

Future<int> neutralize() async {
  falseAnswers = 0;
  trueAnswers = 0;
  next = false;
  buttonLabel = 'Check';
  livesNumber = 5;
  selected = 0;
  c1 = c2 = c3 = c4 = Colors.white;
  shadowColor1 = shadowColor2 = shadowColor3 = shadowColor4 = kGreyShadowColor;
  shadowVerticalBlur1 =
      shadowVerticalBlur2 = shadowVerticalBlur3 = shadowVerticalBlur4 = 2;
  questionNumber = 0;
  return 0;
}
