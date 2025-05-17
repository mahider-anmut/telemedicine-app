import 'package:flutter/material.dart';
import '../utils/themes.dart';
import 'colors.dart';
import 'fontSizes.dart';

class AppTextStyles {

  // static const TextStyle titleStyle = TextStyle(
  //     fontFamily: 'Urbanist',
  //     fontSize: AppFontSizes.large,
  //     fontWeight: FontWeight.w700,
  //     color: AppColors.titleTextColor
  // );

  static TextStyle titleStyle(BuildContext context) {
    return TextStyle(
        fontFamily: 'Urbanist',
        fontSize: AppFontSizes.large,
        fontWeight: FontWeight.w700,
        color: AppTheme
            .getThemeExtension(context)
            .titleTextColor!
    );
  }

  static TextStyle bigTitleStyle(BuildContext context) {
    return TextStyle(
        fontFamily: 'Urbanist',
        fontSize: AppFontSizes.xxl,
        fontWeight: FontWeight.w700,
        color: AppTheme
            .getThemeExtension(context)
            .titleTextColor!
      // color: AppColors.titleTextColor
    );
  }

  static TextStyle bodySmallStyle(BuildContext context) {
    return TextStyle(
        fontFamily: 'Urbanist',
        fontSize: AppFontSizes.small,
        fontWeight: FontWeight.w500,
        color: AppTheme
            .getThemeExtension(context)
            .mainTextColor!
    );
  }

  static const TextStyle bodySmallLinkStyle = TextStyle(
      fontFamily: 'Urbanist',
      fontSize: AppFontSizes.small,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor
  );

  static const TextStyle bodyStyle = TextStyle(
      fontFamily: 'Urbanist',
      fontSize: AppFontSizes.medium,
      fontWeight: FontWeight.w500,
      color: AppColors.mainTextColor
  );

  static const TextStyle bodyAltStyle = TextStyle(
      fontFamily: 'Urbanist',
      fontSize: AppFontSizes.medium,
      fontWeight: FontWeight.w500,
      color: AppColors.mainTextAltColor
  );

  static const TextStyle headerTextLabelStyle =  TextStyle(
    fontFamily: 'Urbanist',
    fontSize: AppFontSizes.xs,
    fontWeight: FontWeight.w400,
    color: AppColors.mainTextAltColor,
  );

  static const TextStyle headerTextTitleStyle =  TextStyle(
    fontFamily: 'Urbanist',
    fontSize: AppFontSizes.large,
    fontWeight: FontWeight.w500,
    color: AppColors.mainTextAltColor,
  );

  static const TextStyle headerTextBodyStyle =  TextStyle(
    fontFamily: 'Urbanist',
    fontSize: AppFontSizes.small,
    fontWeight: FontWeight.w600,
    color: AppColors.mainTextAltColor,
  );

  static const TextStyle hintStyle =  TextStyle(
    fontFamily: 'Urbanist',
    fontSize: AppFontSizes.small,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
  static const TextStyle inputStyle =  TextStyle(
    fontFamily: 'Urbanist',
    fontSize: AppFontSizes.small,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle navigationTextStyle(BuildContext context) {
    return TextStyle(
      fontFamily: 'Urbanist',
      fontSize: AppFontSizes.large,
      fontWeight: FontWeight.w600,
      color: AppTheme.getThemeExtension(context).titleTextColor!,
    );
  }

  static TextStyle sideMenuTitleStyle(BuildContext context) {
    return TextStyle(
        fontFamily: 'Urbanist',
        fontSize: AppFontSizes.small,
        fontWeight: FontWeight.w600,
        color: AppTheme
            .getThemeExtension(context)
            .titleTextColor!
    );
  }

    static TextStyle sideMenuNameStyle(BuildContext context) {
      return TextStyle(
          fontFamily: 'Urbanist',
          fontSize: AppFontSizes.large,
          fontWeight: FontWeight.w700,
          color: AppTheme
              .getThemeExtension(context)
              .titleTextColor
      );
    }

    static const TextStyle cardTitleStyle = TextStyle(
        fontFamily: 'Urbanist',
        fontSize: AppFontSizes.small,
        fontWeight: FontWeight.w700,
        color: AppColors.titleTextColor
    );

    static const TextStyle cardButtonStyle = TextStyle(
        fontFamily: 'Urbanist',
        fontSize: AppFontSizes.small,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryColor
    );

    static TextStyle driverListTitleStyle(BuildContext context) {
      return TextStyle(
          fontFamily: 'Urbanist',
          fontSize: AppFontSizes.xl,
          fontWeight: FontWeight.w500,
          color: AppTheme.getThemeExtension(context).titleTextColor!
      );
    }

    static TextStyle driverHeaderLabelStyle(BuildContext context) {
      return TextStyle(
          fontFamily: 'Urbanist',
          fontSize: AppFontSizes.small,
          fontWeight: FontWeight.w500,
          color: AppTheme.getThemeExtension(context).mainTextColor!
      );
    }

    static TextStyle driverHeaderTitleStyle(BuildContext context) {
      return TextStyle(
          fontFamily: 'Urbanist',
          fontSize: AppFontSizes.large,
          fontWeight: FontWeight.w600,
          color: AppTheme.getThemeExtension(context).titleTextColor!
      );
    }

    static TextStyle driverHeaderSubTitleStyle(BuildContext context) {
      return TextStyle(
          fontFamily: 'Urbanist',
          fontSize: AppFontSizes.small,
          fontWeight: FontWeight.w500,
          color: AppTheme.getThemeExtension(context).mainTextColor!
      );
    }
  }