import 'package:flutter/material.dart';
import 'package:chatnow/allConstants/all_constants.dart';

final appTheme = ThemeData(
  primaryColor: AppColors.spaceLight,
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.spaceLight),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.burgundy),
);
