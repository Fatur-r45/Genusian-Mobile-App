import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/mahasiswa/mahasiswa_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/mahasiswa/mahasiswa_event.dart';
import 'package:genusian_smart_mobile_app/bloc/mahasiswa/mahasiswa_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../model/mahasiswa.dart';

class EditProfile extends StatefulWidget {
  final Mahasiswa? mahasiswa;
  const EditProfile({super.key, required this.mahasiswa});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nama = TextEditingController();
  final jurusan = TextEditingController();
  final tempatLahir = TextEditingController();
  DateTime? tanggalLahir;
  @override
  void initState() {
    super.initState();
    if (widget.mahasiswa != null) {
      setState(() {
        nama.text = widget.mahasiswa!.nama;
        jurusan.text = widget.mahasiswa!.jurusan;
        tempatLahir.text = widget.mahasiswa!.tempatLahir;
        tanggalLahir = widget.mahasiswa!.tanggalLahir;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        forceMaterialTransparency: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: BlocListener<MahasiswaBloc, MahasiswaState>(
        listener: (context, state) {
          if (state is MahasiswaEditState) {
            context.read<MahasiswaBloc>().add(LoadMahasiswa());
          }
        },
        child: BlocBuilder<MahasiswaBloc, MahasiswaState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: TextField(
                      controller: nama,
                      textAlign: TextAlign.left,
                      autocorrect: false,
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.25,
                        letterSpacing: -0.24,
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        label: const Text(
                          "Nama",
                        ),
                        labelStyle: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        floatingLabelStyle: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        hintText: "Contoh: Fatur Rahman Gandi",
                        hintStyle: GoogleFonts.inter(
                          color: const Color(0xFFB2B2B2),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                          letterSpacing: -0.24,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: TextField(
                      controller: jurusan,
                      textAlign: TextAlign.left,
                      autocorrect: false,
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.25,
                        letterSpacing: -0.24,
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        label: const Text(
                          "Jurusan",
                        ),
                        labelStyle: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        floatingLabelStyle: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        hintText: "Contoh: Sistem Informasi",
                        hintStyle: GoogleFonts.inter(
                          color: const Color(0xFFB2B2B2),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                          letterSpacing: -0.24,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: TextField(
                      controller: tempatLahir,
                      textAlign: TextAlign.left,
                      autocorrect: false,
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.25,
                        letterSpacing: -0.24,
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        label: const Text(
                          "Tempat Lahir",
                        ),
                        labelStyle: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        floatingLabelStyle: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        hintText: "Contoh: Sukabumi",
                        hintStyle: GoogleFonts.inter(
                          color: const Color(0xFFB2B2B2),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                          letterSpacing: -0.24,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tanggal Lahir',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextField(
                          controller: TextEditingController(
                              text: tanggalLahir != null
                                  ? DateFormat("dd MMM yyy")
                                      .format(tanggalLahir!)
                                  : ""),
                          onTap: () async {
                            showDatePicker(
                              context: context,
                              initialDate: tanggalLahir ?? DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2050),
                            ).then((value) {
                              if (value != null && value != DateTime.now()) {
                                setState(() {
                                  tanggalLahir = value;
                                });
                              }
                            });
                          },
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                            letterSpacing: -0.24,
                          ),
                          mouseCursor: SystemMouseCursors.click,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.black)),
                            suffixIcon: Icon(
                              Icons.calendar_month_outlined,
                              color: Color(0xFFA80063),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xffA80063)),
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(vertical: 24),
                              ),
                            ),
                            onPressed: () {
                              context.read<MahasiswaBloc>().add(EditMahasiswa(
                                  nama: nama.text,
                                  jurusan: jurusan.text,
                                  tanggalLahir: tanggalLahir!
                                      .add(Duration(days: 1))
                                      .toString(),
                                  tempatLahir: tempatLahir.text));
                            },
                            child: Text(
                              'simpan',
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
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
