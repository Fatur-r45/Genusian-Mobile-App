import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controler;
  const FormInput(
      {required this.controler,
      super.key,
      required this.label,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextField(
        controller: controler,
        textAlign: TextAlign.left,
        autocorrect: false,
        // onChanged: (value) {
        //   controler.text;
        // },
        style: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.25,
          letterSpacing: -0.24,
        ),
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
          label: Text(
            label,
          ),
          labelStyle: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          floatingLabelStyle: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          hintText: hint,
          hintStyle: GoogleFonts.inter(
            color: Color(0xFFB2B2B2),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.25,
            letterSpacing: -0.24,
          ),
        ),
      ),
    );
  }
}
