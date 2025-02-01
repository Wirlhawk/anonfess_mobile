import 'package:flutter/material.dart';

class Style {
  static const primary = Color(0xFFA388EE);
  static const secondary = Color(0xFF5AD775);
  static const muted = Color(0xFF6b7178);
  static const border = Colors.black;

  static final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: Style.border,
      width: 4,
    ),
  );
}
