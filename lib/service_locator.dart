import 'package:boilerplate/localstorage_service.dart';
import 'package:boilerplate/services/image_service.dart';
import 'package:boilerplate/services/login_service.dart';
import 'package:get_it/get_it.dart';

//GetIt locator = GetIt();

GetIt locator = GetIt.I;

Future setupLocator() async{
  var instance = await LocalStrorageService.getInstance();
  locator.registerSingleton<LocalStrorageService>(instance);
  locator.registerSingleton(ImageService());
  locator.registerFactory<LoginService>(() => LoginService());
}


