import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/pengalaman/pengalaman_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/pengalaman/pengalaman_event.dart';
import 'package:genusian_smart_mobile_app/model/pengalaman.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../bloc/pengalaman/pengalaman_state.dart';
import '../../helper/capital_words.dart';

class Pengalaman extends StatelessWidget {
  const Pengalaman({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        forceMaterialTransparency: true,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 26),
            child: IconButton(
                onPressed: () {
                  context.go("/pengalaman/create");
                },
                icon: const Icon(Icons.add)),
          )
        ],
      ),
      body: BlocListener<PengalamanBloc, PengalamanState>(
        listener: (context, state) {
          if (state is PengalamanDelet) {
            context.read<PengalamanBloc>().add(LoadPengalaman());
          }
        },
        child: BlocBuilder<PengalamanBloc, PengalamanState>(
          builder: (context, state) {
            if (state is PengalamanLoadState) {
              return state.pengalaman.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 12),
                      child: ListView.builder(
                        itemCount: state.pengalaman.length,
                        itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: ListTile(
                            onTap: () {
                              return context.go("/pengalaman/create",
                                  extra: PengalamanModel(
                                      id: state.pengalaman[index].id,
                                      kdPengalaman:
                                          state.pengalaman[index].kdPengalaman,
                                      posisiPekerjaan: state
                                          .pengalaman[index].posisiPekerjaan,
                                      namaPerusahaan: state
                                          .pengalaman[index].namaPerusahaan,
                                      jenisPekerjaan: state
                                          .pengalaman[index].jenisPekerjaan,
                                      mulai: state.pengalaman[index].mulai,
                                      sampai: state.pengalaman[index].sampai));
                            },
                            horizontalTitleGap: 24,
                            leading: Container(
                              width: 48,
                              height: 48,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("images/nusaputra-logo.png"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            title: Text(
                              Kapital.capitalizeWords(
                                  state.pengalaman[index].posisiPekerjaan),
                              style: GoogleFonts.poppins(
                                color: const Color(0xFFA80063),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 1.43,
                                letterSpacing: -0.24,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Kapital.capitalizeWords(
                                      "${state.pengalaman[index].namaPerusahaan}  •  ${state.pengalaman[index].jenisPekerjaan}"),
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.67,
                                    letterSpacing: -0.24,
                                  ),
                                ),
                                Text(
                                  "${DateFormat('MMM yyyy').format(state.pengalaman[index].mulai)} - ${DateFormat('MMM yyyy').format(state.pengalaman[index].sampai)}  •  ${state.pengalaman[index].sampai.difference(state.pengalaman[index].mulai).inDays % 30} Bulan",
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFFB2B2B2),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.67,
                                    letterSpacing: -0.24,
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.warning,
                                  animType: AnimType.scale,
                                  title: 'Delete',
                                  desc: 'apakah kamu yakin ingin',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {
                                    context.read<PengalamanBloc>().add(
                                        DeletPengalaman(
                                            state.pengalaman[index].id));
                                  },
                                ).show();
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ),
                        ),
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
      ),
    );
  }
}
