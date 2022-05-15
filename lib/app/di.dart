import 'package:advanced/app/app_prefs.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPref = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPref);
  instance
      .registerLazySingleton<AppPreference>(() => AppPreference(instance()));
}

Future<void> initLoginModule() async {}
