import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../helper/capital_words.dart';

class Pengalaman extends StatelessWidget {
  final String posisiPekerjaan, namaPerusahaan, jenisPekerjaan;
  final DateTime mulai, sampai;
  const Pengalaman({
    super.key,
    required this.posisiPekerjaan,
    required this.namaPerusahaan,
    required this.jenisPekerjaan,
    required this.mulai,
    required this.sampai,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/nusaputra-logo.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Kapital.capitalizeWords(posisiPekerjaan),
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.43,
                  letterSpacing: -0.24,
                ),
              ),
              Text(
                Kapital.capitalizeWords(
                    "${namaPerusahaan}  •  ${jenisPekerjaan}"),
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.67,
                  letterSpacing: -0.24,
                ),
              ),
              Text(
                // 'Jan 2023 - Mar 2023 - 3 Bulan'
                "${DateFormat('MMM yyyy').format(mulai)} - ${DateFormat('MMM yyyy').format(sampai)}  •  ${sampai.difference(mulai).inDays % 30} Bulan",
                style: GoogleFonts.poppins(
                  color: const Color(0xFFB2B2B2),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.67,
                  letterSpacing: -0.24,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
