import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/mahasiswa/mahasiswa_event.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_state.dart';
import '../bloc/mahasiswa/mahasiswa_bloc.dart';
import '../bloc/mahasiswa/mahasiswa_state.dart';

// ignore: camel_case_types
class Hero_Section extends StatelessWidget {
  const Hero_Section({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MahasiswaBloc, MahasiswaState>(
      listener: (context, state) {
        if (state is MahasiswaAboutState) {
          context.read<MahasiswaBloc>().add(LoadMahasiswa());
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 24),
        child: BlocBuilder<MahasiswaBloc, MahasiswaState>(
          builder: (context, state) {
            return Container(
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: state is MahasiswaLoadState
                                ? AssetImage(
                                    "images/${(state.mahasiswa.nim).toString().split('').last}.png")
                                : const AssetImage("images/1.png"),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(96),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          state is MahasiswaLoadState &&
                                  state.mahasiswa.nama != ""
                              ? Text(
                                  state.mahasiswa.nama,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 1.43,
                                    letterSpacing: -0.24,
                                  ),
                                )
                              : BlocBuilder<UserBloc, UserState>(
                                  builder: (context, state) {
                                    // UserSignedIn result = state as UserSignedIn;
                                    return Text(
                                      state is UserSignedIn
                                          ? state.user.name
                                          : "",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        height: 1.43,
                                        letterSpacing: -0.24,
                                      ),
                                    );
                                  },
                                ),
                          Text(
                            state is MahasiswaLoadState
                                ? state.mahasiswa.jurusan
                                : 'no data',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.67,
                              letterSpacing: -0.24,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 221,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4000000059604645),
                      border: Border.all(width: 0.50, color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: state is MahasiswaLoadState
                                  ? (state.mahasiswa.rank == 1
                                      ? const AssetImage("icons/Crown Icon.png")
                                      : const AssetImage("icons/medali.png"))
                                  : const AssetImage("icons/medali.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          state is MahasiswaLoadState
                              ? 'Peringkat ${state.mahasiswa.rank} Sekarang'
                              : "no data",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.43,
                            letterSpacing: -0.24,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
