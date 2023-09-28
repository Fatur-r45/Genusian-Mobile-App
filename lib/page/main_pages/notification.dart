import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              height: 96,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child:
                          Icon(index == 2 ? Icons.person : Icons.leaderboard),
                    ),
                  ),
                  Flexible(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            index == 2
                                ? "Akun anda berhasil dibuat!"
                                : 'Selamat!',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFA80063),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.43,
                              letterSpacing: -0.24,
                            ),
                          ),
                          Text(
                            index == 2
                                ? 'Silahkan segera mengisi profilmu dengan data yang lengkap'
                                : 'Anda telah meraih peringkat 2 dengan 112 point yang terakumulasi!',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.67,
                              letterSpacing: -0.24,
                            ),
                          )
                        ],
                      )),
                  Flexible(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: 20,
                        height: 20,
                        child: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
