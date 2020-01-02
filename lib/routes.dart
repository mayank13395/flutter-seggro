
import 'package:boilerplate/ui/languages.dart';
import 'package:boilerplate/ui/takeImage.dart';
import 'package:flutter/material.dart';

import 'ui/home/home.dart';
import 'ui/login/login.dart';
import 'ui/splash/splash.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String lang = '/language';
  static const String login = '/login';
  static const String home = '/home';
  static const String takeimage = '/takeimage';

  static final routes = <String, WidgetBuilder>{
     splash: (BuildContext context) => SplashScreen(),
     lang: (BuildContext context) => Language(),
     login: (BuildContext context) => LoginScreen(),
     home: (BuildContext context) => HomeScreen(),
     takeimage: (BuildContext context) => TakeImage(),

  };
}



