import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:maths_quiz/ExercicesPages/exercicePage.dart';
import 'package:maths_quiz/account/account.dart';
import 'package:maths_quiz/account/profile.dart';
import 'package:maths_quiz/authenticate/auth_controller.dart';
import 'package:maths_quiz/splashscreen.dart';
import 'ExercicesPages/exercicesList.dart';
import 'constants/constantsColors.dart';
import 'sizeConfig.dart';
import 'mainPage/mainPage.dart';
import 'ExercicesMainPage/exMainPage.dart';

Future<void> main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  //
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        systemNavigationBarColor: Color.fromARGB(0, 255, 255, 255),
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const Quiz(),
        '/account': (context) => const Profile(),
        '/exercicesList': (context) => const ExercicesList(),
        '/exercice': (context) => Exercices(0),
        '/exercice1': (context) => Exercices(1),
        '/exercice2': (context) => Exercices(2),
        '/exercice3': (context) => Exercices(3),
      },
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryColor: kViolet,
        textSelectionTheme: const TextSelectionThemeData(cursorColor: kViolet),
        indicatorColor: kViolet,
      ),
      home: const SplashScreenPage(),
    ),
  );
}

class Quiz extends StatefulWidget {
  static PageController pageController = PageController(initialPage: 0);
  static bool mainPageLoaded = false;

  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        Quiz.mainPageLoaded = true;
        // ignore: avoid_print
        print('Main Page loaded');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    void onTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
      Quiz.pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: kGrey,
        selectedItemColor: kViolet,
        currentIndex: _currentIndex,
        onTap: onTapped,
        items: [
          //
          //Home Icon button
          //
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.home,
              //color: kGrey,
              size: SizeConfig.safeBlockHorizontal * 6,
            ),
            label: "",
          ),
          //
          //Plus icon button
          //
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.plus,
              //color: kGrey,
              size: SizeConfig.safeBlockHorizontal * 6,
            ),
            label: "",
          ),
          //
          //AccountPage icon button
          //
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.solidUser,
              //color: kGrey,
              size: SizeConfig.safeBlockHorizontal * 6,
            ),
            label: "",
          ),
        ],
      ),
      body: SafeArea(
        child: PageView(
          controller: Quiz.pageController,
          onPageChanged: (page) {
            setState(() {
              _currentIndex = page;
            });
          },
          scrollDirection: Axis.horizontal,
          children: const [
            MainPage(),
            ExercicesPage(),
            AccMainPage(),
          ],
        ),
      ),
    );
  }
}


//TODO: put Profile content, Settings...... in place of above containers in PageView

