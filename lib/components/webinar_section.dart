import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Card_Content(),
          Card_Content(),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class Card_Content extends StatelessWidget {
  const Card_Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("mantap");
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 240,
              height: 120,
              clipBehavior: Clip.antiAlias,
              decoration: const ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.50, -0.87),
                  end: Alignment(-0.5, 0.87),
                  colors: [Color(0xF4A80063), Color(0xFF7E0048)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 40,
                    top: 120,
                    child: Opacity(
                      opacity: 0.08,
                      child: Text(
                        'G',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 320,
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                          letterSpacing: -0.24,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: double.infinity,
                    ),
                    child: Center(
                      child: Row(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Webinar',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 1.67,
                                  letterSpacing: -0.24,
                                ),
                              ),
                              Text(
                                'Basic UI/UX Design',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 1.67,
                                  letterSpacing: -0.24,
                                ),
                              ),
                              Text(
                                'By ARKARA Studio',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w600,
                                  height: 2.50,
                                  letterSpacing: -0.24,
                                ),
                              ),
                            ],
                          ),
                          // const SizedBox(width: 40),
                          Container(
                            width: 48,
                            height: 48,
                            padding: const EdgeInsets.all(12),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(96),
                              ),
                            ),
                            child: const Icon(
                              Icons.brush,
                              color: Color(0xFFA80063),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 240,
              height: 80,
              clipBehavior: Clip.antiAlias,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Webinar Basic UI/UX Design',
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.43,
                      letterSpacing: -0.24,
                    ),
                  ),
                  Text(
                    'Jum’at, 14 Apr, 15:00 WIB',
                    style: GoogleFonts.inter(
                      color: const Color(0xFFB2B2B2),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.67,
                      letterSpacing: -0.24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Gratis',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.inter(
                            color: const Color(0xFFA80063),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.43,
                            letterSpacing: -0.24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
