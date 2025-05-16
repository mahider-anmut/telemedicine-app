import 'package:flutter/material.dart';

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? primaryBGColor;

  final Color? primaryColor;
  final Color? primaryLightColor;

  final Color? secondaryColor;
  final Color? secondaryAltColor;

  final Color? titleTextColor;
  final Color? mainTextColor;
  final Color? mainTextAltColor;

  final Color? mainIconColor;
  final Color? secondaryIconColor;

  CustomThemeExtension({this.primaryBGColor,this.primaryColor,this.primaryLightColor,this.secondaryColor,this.titleTextColor,this.mainTextColor,this.mainTextAltColor,this.mainIconColor,this.secondaryIconColor,this.secondaryAltColor});

  @override
  ThemeExtension<CustomThemeExtension> copyWith() {
    return CustomThemeExtension(
      primaryBGColor: primaryBGColor ?? primaryBGColor,
      primaryColor: primaryColor ?? primaryColor,
      primaryLightColor: primaryLightColor ?? primaryLightColor,

      secondaryColor: secondaryColor ?? secondaryColor,
      secondaryAltColor: secondaryColor ?? secondaryColor,

      titleTextColor: titleTextColor ?? titleTextColor,
      mainTextColor: mainTextColor ?? mainTextColor,
      mainTextAltColor: mainTextAltColor ?? mainTextAltColor,

      mainIconColor: mainIconColor ?? mainIconColor,
      secondaryIconColor: secondaryIconColor ?? secondaryIconColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(covariant ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      primaryBGColor: Color.lerp(primaryBGColor, other.primaryBGColor, t),

      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      primaryLightColor: Color.lerp(primaryLightColor, other.primaryLightColor, t),

      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      secondaryAltColor: Color.lerp(secondaryAltColor, other.secondaryAltColor, t),

      titleTextColor: Color.lerp(titleTextColor, other.titleTextColor, t),
      mainTextColor: Color.lerp(mainTextColor, other.mainTextColor, t),
      mainTextAltColor: Color.lerp(mainTextAltColor, other.mainTextAltColor, t),

      mainIconColor: Color.lerp(mainIconColor, other.mainIconColor, t),
      secondaryIconColor: Color.lerp(secondaryIconColor, other.secondaryIconColor, t),
    );
  }






}