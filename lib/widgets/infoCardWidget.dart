import 'package:flutter/material.dart';

import '../utils/themes.dart';

class InfoCardWidget extends StatelessWidget {
  final bool isDarkMode;
  final String icon;
  final String title;
  final String description;

  InfoCardWidget({
    required this.isDarkMode,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isDarkMode ? Color(0xFF3E3E49) : Color(0xFFE9E9E9);
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    Color iconBackgroundColor = AppTheme.getThemeExtension(context).primaryLightColor!;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.43,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          color: backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconBackgroundColor,
              ),
              child: Center(
                child: Image(
                  image: AssetImage(icon),
                  width: 32, // Optional: adjust size
                  height: 32,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: textColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
