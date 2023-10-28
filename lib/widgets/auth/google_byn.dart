import 'package:e_commerce/services/myapp_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: const Icon(Ionicons.logo_google , color: Colors.red,),
      label: Text(
        'Sign in with google',
        style: GoogleFonts.aBeeZee(
          color: Colors.black,
        ),
      ),
      onPressed: () async {

      },
    );
  }
}
