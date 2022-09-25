
import 'package:flutter/material.dart';
import 'package:ubongo/presentation/themes/theme_colors.dart';
import 'package:ubongo/presentation/themes/theme_text.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    fontFamily: 'Inter',
    primaryColor: AppColor.primaryColor,
    textTheme: ThemeText.getDefaultTextTheme(),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    scaffoldBackgroundColor: AppColor.white,
    toggleableActiveColor: AppColor.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: AppColor.black,
        primary: AppColor.primaryColor,
      ),
    ),
  );
}
