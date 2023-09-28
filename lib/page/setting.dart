import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/auth/auth_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/auth/auth_event.dart';
import 'package:genusian_smart_mobile_app/components/hero_section.dart';
import 'package:genusian_smart_mobile_app/model/mahasiswa.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/mahasiswa/mahasiswa_bloc.dart';
import '../bloc/mahasiswa/mahasiswa_state.dart';
import '../cubit/bool.dart';
import '../cubit/incermentBottomNav.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA80063),
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => context.goNamed("test"),
              icon: Icon(Icons.settings))
        ],
      ),
      body: ListView(
        children: [
          // herro section start
          const Hero_Section(),
          // herro section start

          Container(
            height: MediaQuery.of(context).size.height * 3 / 4,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: BlocBuilder<MahasiswaBloc, MahasiswaState>(
              builder: (context, state) {
                if (state is MahasiswaLoadState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () {
                          context.goNamed("edit",
                              extra: Mahasiswa(
                                  nim: state.mahasiswa.nim,
                                  nama: state.mahasiswa.nama,
                                  jurusan: state.mahasiswa.jurusan,
                                  aboutMe: state.mahasiswa.aboutMe,
                                  tempatLahir: state.mahasiswa.tempatLahir,
                                  tanggalLahir: state.mahasiswa.tanggalLahir,
                                  poin: state.mahasiswa.poin,
                                  rank: state.mahasiswa.rank));
                        },
                        leading: const Icon(Icons.edit_note,
                            color: Color(0xFFA80063)),
                        title: Text(
                          'Ubah Profil',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                            letterSpacing: -0.24,
                          ),
                        ),
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.key, color: Color(0xFFA80063)),
                        title: Text(
                          'Ubah Kata Sandi',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                            letterSpacing: -0.24,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.support_agent,
                            color: Color(0xFFA80063)),
                        title: Text(
                          'Hubungi Kami',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                            letterSpacing: -0.24,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.error_outline,
                            color: Color(0xFFA80063)),
                        title: Text(
                          'Sayarat dan Ketentuan',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                            letterSpacing: -0.24,
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0xffA80063)),
                                    padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(vertical: 24),
                                    ),
                                  ),
                                  onPressed: () {
                                    context.read<UserBloc>().add(SignOut());
                                    context
                                        .read<IncermentBottomNav>()
                                        .incerment(0);
                                    context.read<ObscurePassowrd>().isObscure();
                                  },
                                  child: Text(
                                    'Keluar',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      height: 1.25,
                                      letterSpacing: -0.24,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
