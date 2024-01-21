import 'package:flutter/material.dart';

class TitleText {
  static Padding headlineMedium(BuildContext context, {required String text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  static Padding headlineLarge(BuildContext context, {required String text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
}
