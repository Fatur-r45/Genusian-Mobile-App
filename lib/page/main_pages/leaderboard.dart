import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/mahasiswa/mahasiswa_event.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/mahasiswa/mahasiswa_bloc.dart';
import '../../bloc/mahasiswa/mahasiswa_state.dart';
import '../../components/leaderboard_item.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MahasiswaBloc, MahasiswaState>(
      listener: (context, state) {
        if (state is MahasiswaEditState || state is MahasiswaAboutState) {
          context.read<MahasiswaBloc>().add(LoadMahasiswa());
        }
      },
      builder: (context, state) {
        if (state is MahasiswaLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MahasiswaLoadState) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(color: Color(0xFFA80063)),
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  // Section top start
                  SizedBox(
                    height: 310,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // icon top start
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 38,
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'icons/Crown Icon.png'))),
                              ),
                              IconButton(
                                  onPressed: () {
                                    context.goNamed("search");
                                  },
                                  icon: const Icon(Icons.search))
                            ],
                          ),
                        ),
                        // icon top end

                        // top 3 Leaderboard start
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 64,
                                    height: 64,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "images/${(state.allMahasiswa[1].nim).toString().split('').last}.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(96),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 4),
                                    child: Text(
                                      state.allMahasiswa[1].nama,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        height: 1.43,
                                        letterSpacing: -0.24,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Text(
                                      state.allMahasiswa[1].jurusan,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 1.67,
                                        letterSpacing: -0.24,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 64,
                                    height: 73,
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 41),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFF7E0048),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      "2",
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
                            SizedBox(
                              width: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 64,
                                    height: 64,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "images/${(state.allMahasiswa[0].nim).toString().split('').last}.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(96),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 4),
                                    child: Text(
                                      state.allMahasiswa[0].nama,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        height: 1.43,
                                        letterSpacing: -0.24,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Text(
                                      state.allMahasiswa[0].jurusan,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 1.67,
                                        letterSpacing: -0.24,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 64,
                                    height: 105,
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 73),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFF7E0048),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '1',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            height: 1.25,
                                            letterSpacing: -0.24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 64,
                                    height: 64,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "images/${(state.allMahasiswa[2].nim).toString().split('').last}.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(96),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 4),
                                    child: Text(
                                      state.allMahasiswa[2].nama,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        height: 1.43,
                                        letterSpacing: -0.24,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Text(
                                      state.allMahasiswa[2].jurusan,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 1.67,
                                        letterSpacing: -0.24,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 64,
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 17),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFF7E0048),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '3',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            height: 1.25,
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
                        // top 3 Leaderboard end
                      ],
                    ),
                  ),
                  // Section top end

                  // leaderboard 4 kebawah star
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: List.generate(
                          state.allMahasiswa.length,
                          (index) => LeaderBoardItem(
                              allMahasiswa: state.allMahasiswa[index],
                              no: index),
                        ),
                      ),
                    ),
                  ),
                  // leaderboard 4 kebawah end
                ],
              ),
            ),
          );
        }
        return const Center(
          child: Text("No data"),
        );
      },
    );
  }
}
