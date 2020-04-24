import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;


// ........................... this class helps in fectching data from json files from assets/lacale............... 

class AppTranslations {

   Locale locale;
   static Map<dynamic, dynamic> _localisedValues;

    AppTranslations(Locale locale) {
    this.locale = locale;
    _localisedValues = null;
  }

   static AppTranslations of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  static Future<AppTranslations> load(Locale locale) async {
    AppTranslations appTranslations = AppTranslations(locale);
    String jsonContent =
    await rootBundle.loadString("assets/locale/localization_${locale.languageCode}.json");
    print("WWWWWWWWWWWWWWWWW...............$jsonContent");
    _localisedValues = json.decode(jsonContent);
    print("lykhfglhgfljhglkfjhlfgkhjf...............$_localisedValues");
    
    return appTranslations;
  }

  get currentLanguage => locale.languageCode;

  String text(String key) {
    print("key..........  $key");

    print("key..........  ${_localisedValues[key]}");
    // return _localisedValues[key] ?? "$key not found";
  }
  
}