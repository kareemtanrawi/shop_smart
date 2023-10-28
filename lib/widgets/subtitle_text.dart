import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubtitleTextWidget extends StatelessWidget {
  const SubtitleTextWidget({
    super.key,
    required this.label,
    this.fontSize = 14,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.textDecoration = TextDecoration.none,
  });

  final String label;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.aBeeZee(
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration,
        color: color,
        fontStyle: fontStyle,
      ),
    );
  }
}
//TextStyle(
//         fontSize: fontSize,
//         fontWeight: fontWeight,
//         decoration: textDecoration,
//         color: color,
//         fontStyle: fontStyle,
//       ),
