import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({Key key, this.font}) : super(key: key);
  final double font;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Prints',
        style: GoogleFonts.rajdhani(
            fontSize: font, color: Colors.purple, fontWeight: FontWeight.bold),
        children: const <TextSpan>[
          TextSpan(
              text: 'Lab',
              style:
                  TextStyle(fontWeight: FontWeight.normal, color: Colors.grey)),
        ],
      ),
    );
  }
}
