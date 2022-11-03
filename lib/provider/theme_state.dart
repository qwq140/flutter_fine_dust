import 'package:flutter/material.dart';

class ThemeState {

  final Color primaryColor;
  final Color subColor;
  final Color textColor;

  ThemeState({required this.primaryColor, required this.subColor, required this.textColor});

  factory ThemeState.initial() => ThemeState(primaryColor: Color(0xff32a1ff), subColor: Color(0xffcce7ff), textColor: Colors.white);

  ThemeState copyWith({Color? primaryColor, Color? subColor, Color? textColor}) => ThemeState(primaryColor: primaryColor ?? this.primaryColor, subColor: subColor ?? this.subColor, textColor: textColor ?? this.textColor);

}