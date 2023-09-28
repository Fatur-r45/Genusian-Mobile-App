import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/sertifikat/sertifikat_event.dart';
import 'package:genusian_smart_mobile_app/model/sertitifikat.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../bloc/sertifikat/sertifikat_bloc.dart';
import '../bloc/sertifikat/sertifikat_state.dart';
import '../helper/capital_words.dart';

class Sertifikat extends StatelessWidget {
  const Sertifikat({super.key});

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
                  context.go('/sertifikat/create');
                },
                icon: const Icon(Icons.add)),
          )
        ],
      ),
      body: BlocListener<SertifikatBloc, SertifikatState>(
        listener: (context, state) {
          if (state is SertifikatDeleteState) {
            context.read<SertifikatBloc>().add(LoadSertifikatEvent());
          }
        },
        child: BlocBuilder<SertifikatBloc, SertifikatState>(
          builder: (context, state) {
            if (state is SertifikatLoadstate) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                child: ListView.builder(
                  itemCount: state.sertifikat.length,
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: ListTile(
                      onTap: () {
                        return context.go("/sertifikat/create",
                            extra: SertifikatModel(
                                id: state.sertifikat[index].id,
                                kdSertifikat:
                                    state.sertifikat[index].kdSertifikat,
                                title: state.sertifikat[index].title,
                                namaAcara: state.sertifikat[index].namaAcara,
                                keterangan: state.sertifikat[index].keterangan,
                                pdf: state.sertifikat[index].pdf,
                                tanggalDapat:
                                    state.sertifikat[index].tanggalDapat));
                      },
                      horizontalTitleGap: 24,
                      leading: Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/gttc-logo.png"),
                              fit: BoxFit.contain),
                        ),
                      ),
                      title: Text(
                        Kapital.capitalizeWords(
                          state.sertifikat[index].title,
                        ),
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
                              state.sertifikat[index].keterangan,
                            ),
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.67,
                              letterSpacing: -0.24,
                            ),
                          ),
                          Text(
                            DateFormat("MMMM yyy")
                                .format(state.sertifikat[index].tanggalDapat),
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
                          context.read<SertifikatBloc>().add(
                              DeleteSertifikatEvent(
                                  state.sertifikat[index].id));
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
