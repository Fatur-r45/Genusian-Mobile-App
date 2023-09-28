import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/mahasiswa.dart';

class LeaderBoardItem extends StatelessWidget {
  final int no;
  final Mahasiswa allMahasiswa;
  const LeaderBoardItem(
      {super.key, required this.allMahasiswa, required this.no});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(
          flex: 1,
          child: Text(
            '${no + 4}',
            style: GoogleFonts.poppins(
              color: const Color(0xFFA80063),
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.25,
              letterSpacing: -0.24,
            ),
          ),
        ),
        Flexible(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 64,
                height: 64,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "images/${(allMahasiswa.nim).toString().split('').last}.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(96),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 44,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        allMahasiswa.nama,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFA80063),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.43,
                          letterSpacing: -0.24,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        allMahasiswa.jurusan,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.67,
                          letterSpacing: -0.24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            width: 75,
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: ShapeDecoration(
              color: const Color(0xFFA80063),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 19,
                  height: 20,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('icons/medali.png')),
                  ),
                ),
                const SizedBox(width: 4),
                SizedBox(
                  width: 32,
                  child: Text(
                    allMahasiswa.poin.toString(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.25,
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
