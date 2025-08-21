import 'package:flutter/material.dart';
class cusSnk {
  static  customSnkbar(BuildContext context, String message,
      {Color backgroundColor = Colors.black, Duration duration = const Duration(seconds: 2)}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration,
      ),
    );
  }
}