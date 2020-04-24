import 'package:boilerplate/providers/AppState.dart';
import 'package:boilerplate/providers/Auth.dart';
import 'package:boilerplate/routes.dart';
import 'package:boilerplate/screens/splash/splash.dart';
import 'package:boilerplate/services/app_translations_delegate.dart';
import 'package:boilerplate/services/ask_permission.dart';
import 'package:boilerplate/services/firebase_service.dart';
import 'package:boilerplate/services/image_service.dart';
import 'package:boilerplate/services/language_update.dart';
import 'package:boilerplate/services/my_application.dart';
import 'package:boilerplate/services/translations.dart';
// import 'package:boilerplate/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inject/inject.dart';
import 'package:provider/provider.dart';

import 'constants/app_theme.dart';
import 'constants/strings.dart';
import 'di/components/app_component.dart';
import 'di/modules/local_module.dart';
import 'di/modules/netwok_module.dart';
import 'service_locator.dart';
// import 'ui/splash/splash.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:easy_localization/easy_localization.dart';


// adding flutter localisation..................
import 'package:flutter_localizations/flutter_localizations.dart';


// global instance for app component
// TODO find out a better way to use it across application
var appComponent;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) async {
    appComponent = await AppComponent.create(NetworkModule(), LocalModule());

    await setupLocator();
    runApp(appComponent.app);
  });
}

@provide
class MyApp extends StatefulWidget {

    @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }

  
  // This widget is the root of your application.



}

class _MyApp extends State<MyApp> {

   AppTranslationsDelegate _newLocaleDelegate;
   SpecificLocalizationDelegate _localeOverrideDelegate;

   @override
   void initState() {
    super.initState();
  //  _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
   _localeOverrideDelegate = new SpecificLocalizationDelegate(null);
    // application.onLocaleChanged = onLocaleChange;
     applic.onLocaleChanged = onLocaleChange;
  }

   onLocaleChange(Locale locale){
    setState((){
      _localeOverrideDelegate = new SpecificLocalizationDelegate(locale);
    });
  }
 

    @override
  Widget build(BuildContext context) {

      // FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return MultiProvider(
      providers: [

        //  ChangeNotifierProvider(create: (_) => Auth()),
         ChangeNotifierProvider(create: (_) => FireStoreService()),
        //  ChangeNotifierProvider(create: (_) => QuestionsData()),
        // ChangeNotifierProvider(create: (context) => QuestionsData()),


        //  ChangeNotifierProvider(create: (_) =>  QuestionsData()),
        

         

        // ChangeNotifierProvider.value(
        //   value: AppState(),
        // )
      ],
      child :  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          theme: themeData,
          routes: Routes.routes,
          home:  SplashScreen(),

               localizationsDelegates: [
                 _localeOverrideDelegate,
                  const TranslationsDelegate(),
                  GlobalMaterialLocalizations.delegate,

        // defines the default text direction, either left to right or right to left, for the widgets library.
        GlobalWidgetsLocalizations.delegate,
      ],
        supportedLocales: applic.supportedLocales(),
      // supportedLocales: [
      //     const Locale('en', ''),
      //     const Locale('hi', ''),
      // ],





      //     localizationsDelegates: [
      //   _newLocaleDelegate,
      //   const AppTranslationsDelegate(),
      //   //provides localised strings
      //   GlobalMaterialLocalizations.delegate,
      //   //provides RTL support
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: application.supportedLocales(),



      //  localizationsDelegates: [
      //   _localeOverrideDelegate,
      //   const AppTranslationsDelegate(),
      //   //provides localised strings
      //   GlobalMaterialLocalizations.delegate,
      //   //provides RTL support
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: application.supportedLocales(),
    
    )
     );
  }


  //  void onLocaleChange(Locale locale) {

  //   print("called from onlocale changed...............$locale");
  //   setState(() {
  //     _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
  //   });
  // }

}
