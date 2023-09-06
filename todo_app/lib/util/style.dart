import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle styleTitle(context) =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white);
  static TextStyle styleNoteTitle(context) =>
      Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          );
  static TextStyle styleNoteDes(context) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          );
  static TextStyle styleNoteDate(context) =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.black45,
            fontWeight: FontWeight.w500,
          );
}
