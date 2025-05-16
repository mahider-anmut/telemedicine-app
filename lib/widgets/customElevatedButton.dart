import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/colors.dart';
import '../constants/textStyles.dart';
import '../service/localization.dart';
import '../utils/themes.dart';

class CustomElevatedButton extends StatefulWidget {
  final String label;
  final Future<void> Function()? onPressed;
  final Color? bgColor;

  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.bgColor,
  });

  @override
  _CustomElevatedButtonState createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : () async {
          FocusScope.of(context).unfocus();
          setState(() {
            isLoading = true;
          });
          if (widget.onPressed != null) {
            await widget.onPressed!();
          }
          setState(() {
            isLoading = false;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isLoading ? AppColors.primaryLightColor : (widget.bgColor ?? AppTheme.getThemeExtension(context).primaryColor!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isLoading==true ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context).translate('Loading'), style: AppTextStyles.bodyAltStyle),
            SizedBox(width: 8),
            SpinKitFadingCircle(
              color: Colors.white,
              size: 20,
            ),
          ],
        )
            : Text(widget.label, style: AppTextStyles.bodyAltStyle),
      ),
    );
  }
}
