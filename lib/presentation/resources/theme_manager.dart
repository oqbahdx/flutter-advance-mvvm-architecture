import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    primaryColorLight: ColorManager.lightPrimary,
    disabledColor: ColorManager.gray1,
    splashColor: ColorManager.primary,
    // card theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        elevation: AppSize.s4,
        shadowColor: ColorManager.gray),
    // appbar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle: getRegularStyle(
            color: ColorManager.primary, fontSize: FontSize.s16)),
    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.gray1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s17,
        ),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    // text theme
    textTheme: TextTheme(
        displayLarge:
            getLightStyle(color: ColorManager.white, fontSize: FontSize.s22),
        headline1: getSemiBoldStyle(
            color: ColorManager.darkGray, fontSize: FontSize.s16),
        caption: getRegularStyle(color: ColorManager.gray1),
        subtitle1: getMediumStyle(
            color: ColorManager.lightGray, fontSize: FontSize.s14),
        bodyText1: getRegularStyle(color: ColorManager.gray)),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle:
          getMediumStyle(color: ColorManager.gray, fontSize: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManager.gray, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(
        color: ColorManager.error,
      ),
      // enabled border
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.gray, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s8)),
      // focused border
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s8)),
      // error border
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s8)),
    ),
  );
}
