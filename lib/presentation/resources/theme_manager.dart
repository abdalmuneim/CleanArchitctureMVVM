import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    /// Main Color

    primaryColor: ColorsManger.primary,
    primaryColorLight: ColorsManger.lightPrimary,
    primaryColorDark: ColorsManger.darkPrimary,
    disabledColor: ColorsManger.grey1,

    /// CardViewTheme

    cardTheme: CardTheme(
        color: ColorsManger.white,
        shadowColor: ColorsManger.grey,
        elevation: AppSize.s4),

    /// AppBar Theme

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorsManger.primary,
      elevation: AppSize.s4,
      shadowColor: ColorsManger.lightPrimary,
      titleTextStyle: TextStyle(
        fontFamily: FontConstants.fontFamily,
        fontSize: FontsSize.s16,
        fontWeight: FontWeightManger.regular,
        color: ColorsManger.white,
      ),
    ),

    /// Button Theme

    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorsManger.grey1,
      buttonColor: ColorsManger.primary,
      splashColor: ColorsManger.lightPrimary,
    ),

    /// Elevated Button Theme

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            fontFamily: FontConstants.fontFamily,
            fontSize: FontsSize.s17,
            fontWeight: FontWeightManger.regular,
            color: ColorsManger.white,
          ),
          backgroundColor: ColorsManger.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12))),
    ),

    /// Text Theme

    textTheme: TextTheme(
      //
      headlineLarge: TextStyle(
        fontFamily: FontConstants.fontFamily,
        fontSize: FontsSize.s18,
        fontWeight: FontWeightManger.semiBold,
        color: ColorsManger.darkGrey,
      ),

      // For title
      displayLarge: TextStyle(
        fontFamily: FontConstants.fontFamily,
        fontSize: FontsSize.s16,
        fontWeight: FontWeightManger.semiBold,
        color: ColorsManger.darkGrey,
      ),

      // For SubTitle
      headlineMedium: TextStyle(
        fontFamily: FontConstants.fontFamily,
        fontSize: FontsSize.s14,
        fontWeight: FontWeightManger.regular,
        color: ColorsManger.darkGrey,
      ),

      //
      titleLarge: TextStyle(
        fontFamily: FontConstants.fontFamily,
        fontSize: FontsSize.s16,
        fontWeight: FontWeightManger.medium,
        color: ColorsManger.lightGrey,
      ),

      //
      titleMedium: TextStyle(
        fontFamily: FontConstants.fontFamily,
        fontSize: FontsSize.s16,
        fontWeight: FontWeightManger.medium,
        color: ColorsManger.primary,
      ),

      //
      bodyLarge: TextStyle(
        fontFamily: FontConstants.fontFamily,
        fontSize: FontsSize.s14,
        fontWeight: FontWeightManger.regular,
        color: ColorsManger.grey1,
      ),

      //
      bodySmall: TextStyle(
        fontFamily: FontConstants.fontFamily,
        fontSize: FontsSize.s14,
        fontWeight: FontWeightManger.regular,
        color: ColorsManger.grey,
      ),
    ),

    /// Input Decoration Theme (text form filed)

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: TextStyle(
        fontFamily: FontConstants.fontFamily,
        fontSize: FontsSize.s14,
        fontWeight: FontWeightManger.regular,
        color: ColorsManger.grey,
      ),
      labelStyle: TextStyle(
        fontFamily: FontConstants.fontFamily,
        fontSize: FontsSize.s16,
        fontWeight: FontWeightManger.medium,
        color: ColorsManger.grey,
      ),
      errorStyle: TextStyle(
        fontFamily: FontConstants.fontFamily,
        fontSize: FontsSize.s14,
        fontWeight: FontWeightManger.regular,
        color: ColorsManger.error,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorsManger.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManger.grey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManger.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorsManger.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
