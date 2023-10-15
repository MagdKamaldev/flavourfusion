import 'package:flavorfusion/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context, CupertinoPageRoute(builder: (context) => widget), (route) {
      return false;
    });

void showCustomSnackBar(
    BuildContext context, String message, Color backgroundColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          message,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 2),
    ),
  );
}

Widget defaultbottomNav({
  required BuildContext context,
  required String text,
  Widget? screenToGoTo,
  VoidCallback? function,
}) =>
    GestureDetector(
      onTap: () {
        function!();
      },
      child: Container(
        color: carrebianCurrent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.087,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: lavendarBlush, fontSize: 18),
          ),
        ),
      ),
    );
