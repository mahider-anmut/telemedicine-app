import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../extensions/CustomThemeExtension.dart';
import '../providers/themeProvider.dart';

class AppTheme {

  static final ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(
      primary: AppLightColors.primaryColor,
      secondary: AppLightColors.secondaryColor,
      surface: AppLightColors.primaryBGColor,
      onPrimary: AppLightColors.mainTextAltColor, // Text color on primary color
      onSecondary: AppLightColors.mainTextColor,
      onSurface: AppLightColors.titleTextColor,
      error: Colors.red,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    primaryColor: AppLightColors.primaryColor,
    hintColor: AppLightColors.secondaryColor,

    scaffoldBackgroundColor: AppLightColors.primaryBGColor,
    iconTheme: const IconThemeData(
      color: AppLightColors.mainIconColor,
    ),
    extensions: [
      CustomThemeExtension(
        primaryBGColor:AppLightColors.primaryBGColor,

        primaryColor:AppLightColors.primaryColor,
        primaryLightColor:AppLightColors.primaryLightColor,

        secondaryColor:AppLightColors.secondaryColor,
        secondaryAltColor: AppLightColors.secondaryAltColor,

        titleTextColor:AppLightColors.titleTextColor,
        mainTextColor:AppLightColors.mainTextColor,
        mainTextAltColor:AppLightColors.mainTextAltColor,

        mainIconColor:AppLightColors.mainIconColor,
        secondaryIconColor:AppLightColors.secondaryIconColor
      )
    ]
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme(
      primary: AppDarkColors.primaryColor,
      secondary: AppDarkColors.secondaryColor,
      surface: AppDarkColors.primaryBGColor,
      onPrimary: AppDarkColors.mainTextAltColor, // Text color on primary color
      onSecondary: AppDarkColors.mainTextColor,
      onSurface: AppDarkColors.titleTextColor,
      error: Colors.red,
      onError: Colors.black,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    primaryColor: AppDarkColors.primaryColor,
    hintColor: AppDarkColors.secondaryColor,
    scaffoldBackgroundColor: AppDarkColors.primaryBGColor,
    iconTheme: const IconThemeData(
      color: AppDarkColors.mainIconColor,
    ),
    extensions: [
      CustomThemeExtension(
          primaryBGColor:AppDarkColors.primaryBGColor,

          primaryColor:AppDarkColors.primaryColor,
          primaryLightColor:AppDarkColors.primaryLightColor,

          secondaryColor:AppDarkColors.secondaryColor,
          secondaryAltColor: AppDarkColors.secondaryAltColor,

          titleTextColor:AppDarkColors.titleTextColor,
          mainTextColor:AppDarkColors.mainTextColor,
          mainTextAltColor:AppDarkColors.mainTextAltColor,

          mainIconColor:AppDarkColors.mainIconColor,
          secondaryIconColor:AppDarkColors.secondaryIconColor
      )
    ]
  );


  static CustomThemeExtension getThemeExtension(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final customThemeExtension = Theme.of(context).extension<CustomThemeExtension>();

    if(customThemeExtension == null){
      return themeProvider.isDarkMode ?CustomThemeExtension(
          primaryBGColor:AppDarkColors.primaryBGColor,

          primaryColor:AppDarkColors.primaryColor,
          primaryLightColor:AppDarkColors.primaryLightColor,

          secondaryColor:AppDarkColors.secondaryColor,
          secondaryAltColor: AppDarkColors.secondaryColor,

          titleTextColor:AppDarkColors.titleTextColor,
          mainTextColor:AppDarkColors.mainTextColor,
          mainTextAltColor:AppDarkColors.mainTextAltColor,

          mainIconColor:AppDarkColors.mainIconColor,
          secondaryIconColor:AppDarkColors.secondaryIconColor
      ):CustomThemeExtension(
          primaryBGColor:AppLightColors.primaryBGColor,

          primaryColor:AppLightColors.primaryColor,
          primaryLightColor:AppLightColors.primaryLightColor,

          secondaryColor:AppLightColors.secondaryColor,
          secondaryAltColor: AppLightColors.secondaryColor,

          titleTextColor:AppLightColors.titleTextColor,
          mainTextColor:AppLightColors.mainTextColor,
          mainTextAltColor:AppLightColors.mainTextAltColor,

          mainIconColor:AppLightColors.mainIconColor,
          secondaryIconColor:AppLightColors.secondaryIconColor
      );
    }else{
      return customThemeExtension;
    }
  }
}