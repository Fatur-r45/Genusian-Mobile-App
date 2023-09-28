import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/components/Appbar_menu_components/AppBar_Home.dart';
import 'package:genusian_smart_mobile_app/helper/capital_words.dart';
import 'package:go_router/go_router.dart';

import '../bloc/mahasiswa/mahasiswa_bloc.dart';
import '../bloc/mahasiswa/mahasiswa_event.dart';
import '../bloc/mahasiswa/mahasiswa_state.dart';
import '../model/get_all_data_from_mahasiswa.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nama = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFD),
      appBar: AppbarMenuHome(
        focus: true,
        nama: nama,
        shadow: 0,
        color: const Color(0xFFFCFCFD),
        backButton: IconButton(
            onPressed: () {
              context.read<MahasiswaBloc>().add(LoadMahasiswa());
              context.go("/");
            },
            icon: const Icon(
              Icons.cancel_outlined,
              color: Color(0xffA80063),
            )),
      ),
      body: BlocBuilder<MahasiswaBloc, MahasiswaState>(
        builder: (context, state) {
          if (state is MahasiswaSearchState) {
            if (state.searchMahsiswa.isNotEmpty) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                child: ListView.builder(
                  itemCount: state.searchMahsiswa.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        context.goNamed("preview",
                            extra: AllDataMahasiswa(
                              nim: state.searchMahsiswa[index].nim,
                              nama: state.searchMahsiswa[index].nama,
                              jurusan: state.searchMahsiswa[index].jurusan,
                              aboutMe: state.searchMahsiswa[index].aboutMe,
                              tempatLahir:
                                  state.searchMahsiswa[index].tempatLahir,
                              tanggalLahir:
                                  state.searchMahsiswa[index].tanggalLahir,
                              point: state.searchMahsiswa[index].point,
                              rank: state.searchMahsiswa[index].rank,
                              pendidikans:
                                  state.searchMahsiswa[index].pendidikans,
                              pengalamans:
                                  state.searchMahsiswa[index].pengalamans,
                              sertifikats:
                                  state.searchMahsiswa[index].sertifikats,
                            ),
                            pathParameters: {
                              "nama": state.searchMahsiswa[index].nama
                            });
                      },
                      titleAlignment: ListTileTitleAlignment.center,
                      leading: Container(
                        // alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "images/${(state.searchMahsiswa[index].nim).toString().split('').last}.png"),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(96),
                          ),
                        ),
                      ),
                      title: Text(Kapital.capitalizeWords(
                          state.searchMahsiswa[index].nama)),
                      subtitle: Text(Kapital.capitalizeWords(
                          state.searchMahsiswa[index].jurusan)),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text("user undifined"),
              );
            }
          }
          return const Center(
            child: Text("user undifined"),
          );
        },
      ),
    );
  }
}
