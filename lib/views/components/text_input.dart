import 'package:anonfess_mobile/style/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInput extends StatelessWidget {
  final bool obscureText;
  final TextEditingController? controller;
  final String label;
  final String placeholder;

  const TextInput({
    super.key,
    this.obscureText = false,
    required this.controller,
    required this.label,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.lexend(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            enabledBorder: Style.outlineInputBorder,
            focusedBorder: Style.outlineInputBorder,
            fillColor: Colors.white,
            filled: true,
            hintText: placeholder,
            hintStyle: GoogleFonts.lexend(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
