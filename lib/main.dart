import 'package:boilerplate/providers/AppState.dart';
import 'package:boilerplate/providers/Auth.dart';
import 'package:boilerplate/routes.dart';
import 'package:boilerplate/services/ask_permission.dart';
import 'package:boilerplate/services/image_service.dart';
import 'package:boilerplate/ui/home/home.dart';
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
import 'ui/splash/splash.dart';

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
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

      // FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return MultiProvider(
      providers: [

         ChangeNotifierProvider(create: (_) => Auth()),
        // ChangeNotifierProvider.value(
        //   value: AppState(),
        // )
      ],
      child :  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          theme: themeData,
          routes: Routes.routes,
          home:  SplashScreen()
      
    
      // ChangeNotifierProvider<ImageService>(
      //     create: (_) => ImageService(),
      //     child:   HomeScreen(),
      //   ),
    
      // home: AskForPermission(),
    )
     );
  }
}
