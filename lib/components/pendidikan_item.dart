import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../helper/capital_words.dart';

class PendidikanItems extends StatelessWidget {
  final String namaInstansi, bidangStudi;
  final DateTime mulai, sampai;

  const PendidikanItems({
    super.key,
    required this.namaInstansi,
    required this.bidangStudi,
    required this.mulai,
    required this.sampai,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Kapital.capitalizeWords(namaInstansi).split(" ")[0] !=
                        "Universitas"
                    ? const AssetImage("images/school-logo.png")
                    : const AssetImage("images/nusaputra-logo.png"),
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
                Kapital.capitalizeWords(bidangStudi),
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.43,
                  letterSpacing: -0.24,
                ),
              ),
              Text(
                Kapital.capitalizeWords(namaInstansi),
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.67,
                  letterSpacing: -0.24,
                ),
              ),
              Text(
                DateTime.now().isBefore(sampai)
                    ? "Sekarang"
                    : "${DateFormat("MMM yyy").format(mulai)} - ${DateFormat("MMM yyy").format(sampai)}",
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
        ],
      ),
    );
  }
}
