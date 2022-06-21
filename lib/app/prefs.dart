import 'package:advanced/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String appLanguageKey = "appLanguageKey";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(appLanguageKey);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguagesType.english.getValue();
    }
  }
}
