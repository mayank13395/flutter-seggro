// import 'package:boilerplate/routes.dart';
// // import 'package:boilerplate/ui/splash/splash.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:easy_localization/easy_localization.dart';

// void main() => runApp(EasyLocalization(child: MyApp()));

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var data = EasyLocalizationProvider.of(context).data;
//     return EasyLocalizationProvider(
//       data: data,
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         localizationsDelegates: [
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           //app-specific localization
//           EasylocaLizationDelegate(
//               locale: data.locale,
//               path: 'assets/locale'),
//         ],
//         supportedLocales: [Locale('en', 'US'), Locale('ar', 'DZ')],
//         locale: data.savedLocale,
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//          routes: Routes.routes,
//         home: SplashScreen(),
//       ),
//     );
//   }
// } 

// // class MyHomePage extends StatefulWidget {
// //   MyHomePage({Key key, this.title}) : super(key: key);

// //   final String title;

// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   int counter = 0;
// //   incrementCounter() {
// //     setState(() {
// //       counter++;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     var data = EasyLocalizationProvider.of(context).data;
// //     return EasyLocalizationProvider(
// //       data: data,
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text(AppLocalizations.of(context).tr('title')),
// //           actions: <Widget>[
// //             FlatButton(
// //               child: Text("English"),
// //               color: Localizations.localeOf(context).languageCode == "en"
// //                   ? Colors.lightBlueAccent
// //                   : Colors.blue,
// //               onPressed: () {
// //                 this.setState(() {
// //                   data.changeLocale(Locale("en","US"));
// //                   print(Localizations.localeOf(context).languageCode);
// //                 });
// //               },
// //             ),
// //             FlatButton(
// //               child: Text("عربي"),
// //               color: Localizations.localeOf(context).languageCode == "ar"
// //                   ? Colors.lightBlueAccent
// //                   : Colors.blue,
// //               onPressed: () {
// //                 this.setState(() {
// //                   data.changeLocale(Locale("ar","DZ"));
// //                   print(Localizations.localeOf(context).languageCode);
// //                 });
// //               },
// //             )
// //           ],
// //         ),
// //         body: Center(
// //           child: new Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //               new Text(AppLocalizations.of(context)
// //                   .tr('msg', args: ['aissat', 'Flutter'])),
// //               new Text(AppLocalizations.of(context).plural('clicked', counter)),
// //               new FlatButton(
// //                 onPressed: () async {
// //                   incrementCounter();
// //                 },
// //                 child: new Text(AppLocalizations.of(context).tr('clickMe')),
// //               ),
// //               new Text(
// //                 AppLocalizations.of(context).tr('profile.reset_password.title'),
// //               ),
// //             ],
// //           ),
// //         ),
// //         floatingActionButton: FloatingActionButton(
// //           onPressed: incrementCounter,
// //           child: Text('+1'),
// //         ),
// //       ),
// //     );
// //   }
// // }