import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitlesTextWidget extends StatelessWidget {
  const TitlesTextWidget({
    super.key,
    required this.label,
    this.fontSize = 20,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.textDecoration = TextDecoration.none,
    this.maxLines,
  });

  final String label;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration textDecoration;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(label,
        maxLines: maxLines,
        style: GoogleFonts.aBeeZee(
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: textDecoration,
          color: color,
          fontStyle: fontStyle,
        ));
  }
}
