// import 'package:boilerplate/screens/askquestion.dart';
// import 'package:boilerplate/screens/firstquestion.dart';
// import 'package:boilerplate/screens/getimagedata.dart';
import 'package:boilerplate/screens/language/languages.dart';
// import 'package:boilerplate/screens/languages.dart';
import 'package:boilerplate/screens/languageselector/language_selector.dart';
// import 'package:boilerplate/screens/linear_percentage.dart';
// import 'package:boilerplate/screens/mytranslation.dart';
import 'package:boilerplate/screens/questions_set/questions.dart';
// import 'package:boilerplate/screens/result.dart';
// import 'package:boilerplate/screens/secondquestion.dart';
// import 'package:boilerplate/screens/takeImage.dart';
import 'package:boilerplate/widgets/linear_percentage.dart';
import 'package:boilerplate/widgets/mytranslation.dart';
import 'package:flutter/material.dart';
import 'garbage/result.dart';
import 'garbage/secondquestion.dart';
import 'garbage/takeImage copy.dart';
import 'screens/home/home.dart';
import 'screens/login/login.dart';
import 'screens/splash/splash.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String lang = '/language';
  static const String login = '/login';
  static const String home = '/home';
  static const String takeimage = '/takeimage';
  static const String imagedata = '/getimagedata';
  static const String firstques = '/firstquestion';
  static const String secondques = '/secondquestion';
   static const String result = '/result';
   static const String askquestion = '/askquestion';
    static const String chooselang = '/chooselang';
    static const String myanimate = '/myanimate';
    static const String questions_set = '/questions_set';
    static const String linearbar = '/linear_bar';


    


  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    lang: (BuildContext context) => Language(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    takeimage: (BuildContext context) => TakeImage(),
    // imagedata: (BuildContext context) => GetImageData(),
    // firstques: (BuildContext context) => FirstQuestion(),
    secondques: (BuildContext context) => SecondQuestion(),
    result: (BuildContext context) => Result(),
    // askquestion: (BuildContext context) => AskQuestions(),
    chooselang: (BuildContext context) => LanguageSelectorPage(),
    myanimate: (BuildContext context) => EasingAnimationWidget(),
    questions_set: (BuildContext context) => MyQUestions(),
    linearbar: (BuildContext context) => LinearPercecentBar(),




  };
}
