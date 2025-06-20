import 'package:flutter/material.dart';

import '../../constants/colors.dart';


class Text1 extends StatelessWidget {
  final String text1;
  final Color color;
  final double size;
  const Text1({
    super.key,
    required this.text1,
    this.color = AppColors.text1Color,
    this.size = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text1,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: size,
        ),
    );
  }
}
