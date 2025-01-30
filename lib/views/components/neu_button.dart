import 'package:anonfess_mobile/style/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NeuButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final double? padding;
  final Color? color;
  const NeuButton({
    super.key,
    required this.label,
    this.onTap,
    this.padding = 8.0,
    this.color = Style.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding!),
        width: double.infinity,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(width: 4),
            borderRadius: BorderRadius.circular(15)),
        alignment: Alignment.center,
        child: Text(
          label,
          style: GoogleFonts.lexend(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
