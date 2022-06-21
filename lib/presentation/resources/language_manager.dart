enum LanguagesType { arabic, english }

const String arabicLanguage = "ar";
const String englishLanguage = "en";

extension LanguagesTypeExtension on LanguagesType {
  String getValue() {
    switch (this) {
      case LanguagesType.arabic:
        return arabicLanguage;
      case LanguagesType.english:
        return englishLanguage;
    }
  }
}
