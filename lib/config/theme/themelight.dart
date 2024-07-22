import 'package:flutter/material.dart';
import 'themetext.dart';
import 'themecolor.dart';

class Themelight {
  Themelight._();

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Themecolor.primaryLight,
      appBarTheme: AppBarTheme(
        backgroundColor: Themecolor.primaryLight,
        titleTextStyle:
            Themetext.titleTextStyle.copyWith(color: Themecolor.primary,
            // fontSize: 22
            ),
      ),
      textTheme: Themetext.textTheme.apply(bodyColor: Themecolor.black),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Themecolor.white,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Themecolor.white,
        titleTextStyle:
            Themetext.titleTextStyle.copyWith(color: Themecolor.black),
        contentTextStyle:
            Themetext.textTheme.bodyMedium?.copyWith(color: Themecolor.black),
      ),
      useMaterial3: true,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Themecolor.primary,
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          minimumSize: const Size(327.0, 56.0),
        ),
      ),
      iconTheme: IconThemeData(color: Themecolor.black));
}
