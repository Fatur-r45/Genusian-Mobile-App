import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/helper/capital_words.dart';
import 'package:genusian_smart_mobile_app/model/pendidikan_model.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../bloc/pendidikan/pendidikan_bloc.dart';

class Pendidikan extends StatelessWidget {
  const Pendidikan({super.key});

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
                  context.go("/pendidikan/create");
                },
                icon: Icon(Icons.add)),
          )
        ],
      ),
      body: BlocListener<PendidikanBloc, PendidikanState>(
        listener: (context, state) {
          if (state is PendidikanDeleteState) {
            context.read<PendidikanBloc>().add(LoadPendidikanEvent());
          }
        },
        child: BlocBuilder<PendidikanBloc, PendidikanState>(
          builder: (context, state) {
            if (state is PendidikanLoadState) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                child: ListView.builder(
                  itemCount: state.pendidikan.length,
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: ListTile(
                      onTap: () {
                        return context.go("/pendidikan/create",
                            extra: PendidikanModel(
                                id: state.pendidikan[index].id,
                                kdPendidikan:
                                    state.pendidikan[index].kdPendidikan,
                                namaInstansi:
                                    state.pendidikan[index].namaInstansi,
                                gelar: state.pendidikan[index].gelar,
                                bidangStudi:
                                    state.pendidikan[index].bidangStudi,
                                mulai: state.pendidikan[index].mulai,
                                sampai: state.pendidikan[index].sampai));
                      },
                      horizontalTitleGap: 24,
                      leading: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Kapital.capitalizeWords(state
                                              .pendidikan[index].namaInstansi)
                                          .split(" ")[0] !=
                                      "Universitas"
                                  ? const AssetImage("images/school-logo.png")
                                  : const AssetImage(
                                      "images/nusaputra-logo.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      title: Text(
                        Kapital.capitalizeWords(
                            state.pendidikan[index].bidangStudi),
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
                                state.pendidikan[index].namaInstansi),
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.67,
                              letterSpacing: -0.24,
                            ),
                          ),
                          Text(
                            "${DateFormat("MMM yyy").format(state.pendidikan[index].mulai)} - ${DateFormat("MMM yyy").format(state.pendidikan[index].sampai)}",
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
                              context.read<PendidikanBloc>().add(
                                  DeletePendidikanEvent(
                                      state.pendidikan[index].id));
                            },
                          ).show();
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                ),
              );
            }
            return Center(
              child: Text("No Data"),
            );
          },
        ),
      ),
    );
  }
}
