import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utils {
  static Color hexToColor(String hex) {
    assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

    return Color(int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xFF000000 : 0x00000000));
  }

  static void showToast(String msg, {String type = "success", ToastGravity position = ToastGravity.CENTER}) {
    Color backgroundColor;

    switch (type.toLowerCase()) {
      case 'success':
        backgroundColor = Colors.green;
        break;
      case 'error':
        backgroundColor = Colors.redAccent;
        break;
      case 'info':
        backgroundColor = Colors.blueAccent;
        break;
      default:
        backgroundColor = Colors.grey;
        break;
    }

    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: backgroundColor,
      gravity: position,
    );
  }

  static void showSnackBar(BuildContext context,String msg, {String type = "success"}) {
    Color backgroundColor;

    switch (type.toLowerCase()) {
      case 'success':
        backgroundColor = Colors.green;
        break;
      case 'error':
        backgroundColor = Colors.redAccent;
        break;
      case 'info':
        backgroundColor = Colors.blueAccent;
        break;
      default:
        backgroundColor = Colors.grey;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: backgroundColor,
      ),
    );
  }

  static void showConfirmationDialog(BuildContext context,String title,String body,VoidCallback onConfirm,{String confirmLabel = "Confirm",String cancelLabel = "Cancel",VoidCallback? onCancel}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              child: Text(cancelLabel),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                if(onCancel!=null){
                  onCancel();
                }
              },
            ),
            TextButton(
              child: Text(confirmLabel),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                onConfirm(); // Execute the confirmation action
              },
            ),
          ],
        );
      },
    );
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static double screenWidth() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.width;
  }

  static double screenHeight() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.height;
  }

  static String capitalize(String string) {
    if (string.isEmpty) return string;
    return string[0].toUpperCase() + string.substring(1);
  }


}