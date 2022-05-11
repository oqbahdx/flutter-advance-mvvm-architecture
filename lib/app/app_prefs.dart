import 'package:advanced/presentation/resources/languages_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LANGUAGE_KEY = "LANGUAGE_KEY";

class AppPreference {
  final SharedPreferences _sharedPreferences;

  AppPreference(this._sharedPreferences);

  Future<String?> getLanguage() async {
    String? language = await _sharedPreferences.getString(LANGUAGE_KEY);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default language
      LanguageType.ENGLISH;
    }
  }
}
