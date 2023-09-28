import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../helper/capital_words.dart';

class SertifikatItems extends StatelessWidget {
  final String title, keterangan;
  final DateTime tanggalDapat;
  const SertifikatItems({
    super.key,
    required this.title,
    required this.keterangan,
    required this.tanggalDapat,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 21.12,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/gttc-logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Kapital.capitalizeWords(title),
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.43,
                    letterSpacing: -0.24,
                  ),
                ),
                Text(
                  Kapital.capitalizeWords(keterangan),
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    height: 1.67,
                    letterSpacing: -0.24,
                  ),
                ),
                Text(
                  DateFormat("MMMM yyy").format(tanggalDapat),
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFB2B2B2),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.67,
                    letterSpacing: -0.24,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
