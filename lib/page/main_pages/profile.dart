import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/mahasiswa/mahasiswa_event.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/components_items.dart';
import '../../bloc/mahasiswa/mahasiswa_bloc.dart';
import '../../bloc/mahasiswa/mahasiswa_state.dart';
import '../../bloc/pendidikan/pendidikan_bloc.dart';
import '../../bloc/pengalaman/pengalaman_bloc.dart';
import '../../bloc/pengalaman/pengalaman_state.dart';
import '../../bloc/sertifikat/sertifikat_bloc.dart';
import '../../bloc/sertifikat/sertifikat_state.dart';
import '../../cubit/bool.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA80063),
      body: ListView(
        children: [
          // herro section start
          const Hero_Section(),
          // herro section start

          Container(
            // height: MediaQuery.of(context).size.height * 3 / 4,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Column(
              children: [
                // about me section start
                BlocBuilder<AboutCubit, bool>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tentang Saya',
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.25,
                                  letterSpacing: -0.24,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  return context.read<AboutCubit>().isAbout();
                                },
                                icon: Icon(
                                  state == true ? Icons.cancel : Icons.edit,
                                  color: const Color(0xFFA80063),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          state == true
                              ? BlocBuilder<MahasiswaBloc, MahasiswaState>(
                                  builder: (context, state) {
                                    MahasiswaLoadState aboutValue =
                                        state as MahasiswaLoadState;
                                    return TextField(
                                      controller: TextEditingController(
                                          text: aboutValue.mahasiswa.aboutMe),
                                      maxLines: null,
                                      textInputAction: TextInputAction.done,
                                      onSubmitted: (value) {
                                        context
                                            .read<MahasiswaBloc>()
                                            .add(UpdateAboutMe(value));
                                      },
                                      onEditingComplete:
                                          context.read<AboutCubit>().isAbout,
                                      autocorrect: false,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      decoration: const InputDecoration(
                                        label: Text("Edit About Me"),
                                      ),
                                    );
                                  },
                                )
                              : BlocListener<MahasiswaBloc, MahasiswaState>(
                                  listener: (context, state) {
                                    if (state is MahasiswaAboutState) {
                                      context
                                          .read<MahasiswaBloc>()
                                          .add(LoadMahasiswa());
                                    }
                                  },
                                  child: BlocBuilder<MahasiswaBloc,
                                      MahasiswaState>(
                                    builder: (context, state) {
                                      if (state is MahasiswaLoadingState) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      if (state is MahasiswaLoadState) {
                                        return Text(
                                          state.mahasiswa.aboutMe,
                                          textAlign: TextAlign.justify,
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        );
                                      }
                                      return const Center(
                                        child: Text("No Data"),
                                      );
                                    },
                                  ),
                                ),
                        ],
                      ),
                    );
                  },
                ),
                // about me section end

                // Experience section start
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pengalaman',
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.25,
                              letterSpacing: -0.24,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context.goNamed("pengalaman");
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Color(0xFFA80063),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      BlocBuilder<PengalamanBloc, PengalamanState>(
                        builder: (context, state) {
                          if (state is PengalamanLoadState) {
                            return state.pengalaman.isNotEmpty
                                ? Column(
                                    children: List.generate(
                                      state.pengalaman.length,
                                      (index) => Pengalaman(
                                          posisiPekerjaan: state
                                              .pengalaman[index]
                                              .posisiPekerjaan,
                                          namaPerusahaan: state
                                              .pengalaman[index].namaPerusahaan,
                                          jenisPekerjaan: state
                                              .pengalaman[index].jenisPekerjaan,
                                          mulai: state.pengalaman[index].mulai,
                                          sampai:
                                              state.pengalaman[index].sampai),
                                    ),
                                  )
                                : const Center(
                                    child: Text("No Data"),
                                  );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // Experience section start

                // Pendidikan section start
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pendidikan',
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.25,
                              letterSpacing: -0.24,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context.goNamed("pendidikan");
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Color(0xFFA80063),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      // item pendidikan section start
                      BlocBuilder<PendidikanBloc, PendidikanState>(
                        builder: (context, state) {
                          if (state is PendidikanLoadState) {
                            return state.pendidikan.isNotEmpty
                                ? Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(
                                      state.pendidikan.length,
                                      (index) => PendidikanItems(
                                          namaInstansi: state
                                              .pendidikan[index].namaInstansi,
                                          bidangStudi: state
                                              .pendidikan[index].bidangStudi,
                                          mulai: state.pendidikan[index].mulai,
                                          sampai:
                                              state.pendidikan[index].sampai),
                                    ),
                                  )
                                : const Center(
                                    child: Text("No Data"),
                                  );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                      // item pendidikan section end
                    ],
                  ),
                ),
                // Pendidikan section start

                // Sertifikat section start
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sertifikat',
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.25,
                              letterSpacing: -0.24,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context.goNamed('sertifikat');
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Color(0xFFA80063),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      BlocBuilder<SertifikatBloc, SertifikatState>(
                        builder: (context, state) {
                          if (state is SertifikatLoadstate) {
                            return state.sertifikat.isNotEmpty
                                ? Column(
                                    children: List.generate(
                                      state.sertifikat.length,
                                      (index) => SertifikatItems(
                                          title: state.sertifikat[index].title,
                                          keterangan: state
                                              .sertifikat[index].keterangan,
                                          tanggalDapat: state
                                              .sertifikat[index].tanggalDapat),
                                    ),
                                  )
                                : const Center(
                                    child: Text("No Data"),
                                  );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      )
                    ],
                  ),
                )
                // Sertifikat section start
              ],
            ),
          )
        ],
      ),
    );
  }
}
