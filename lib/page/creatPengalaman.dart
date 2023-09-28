import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/pengalaman/pengalaman_event.dart';
import 'package:genusian_smart_mobile_app/bloc/pengalaman/pengalaman_state.dart';
import 'package:genusian_smart_mobile_app/model/pengalaman.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../bloc/pengalaman/pengalaman_bloc.dart';
import '../components/form_input.dart';

class CreatePengalaman extends StatefulWidget {
  final PengalamanModel? pengalaman;

  const CreatePengalaman({super.key, this.pengalaman});
  @override
  State<CreatePengalaman> createState() => _CreatePengalamanState();
}

class _CreatePengalamanState extends State<CreatePengalaman> {
  DateTime? jadwalMulai;
  DateTime? jadwalSampai;
  final DateFormat formatter = DateFormat('dd MMM yyyy');
  final posisi = TextEditingController();
  final namaPerusahaan = TextEditingController();
  final jenisPekerjaan = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.pengalaman != null) {
      setState(() {
        posisi.text = widget.pengalaman!.posisiPekerjaan;
        namaPerusahaan.text = widget.pengalaman!.namaPerusahaan;
        jenisPekerjaan.text = widget.pengalaman!.jenisPekerjaan;
        jadwalMulai = widget.pengalaman!.mulai;
        jadwalSampai = widget.pengalaman!.sampai;
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
      body: BlocListener<PengalamanBloc, PengalamanState>(
        listener: (context, state) {
          if (state is PengalamanPostState) {
            context.read<PengalamanBloc>().add(LoadPengalaman());
          }
          if (state is PengalamanPutState) {
            context.read<PengalamanBloc>().add(LoadPengalaman());
          }
        },
        child: BlocBuilder<PengalamanBloc, PengalamanState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // posisi pekerjaan start
                  FormInput(
                    hint: 'Contoh : UI/UX Designer',
                    label: 'Posisi Pekerjaan',
                    controler: posisi,
                  ),
                  // posisi pekerjaan end
                  // Nama Perusahaan start
                  FormInput(
                    label: "Nama Perusahaan",
                    hint: "Contoh : Universitas Nusa Putra",
                    controler: namaPerusahaan,
                  ),
                  // Nama Perusahaan end
                  // Jenis Pekerjaan start
                  FormInput(
                    label: "Jenis Pekerjaan",
                    hint: "Contoh : Pekerjaan Tetap",
                    controler: jenisPekerjaan,
                  ),
                  // Jenis Pekerjaan end
                  // jadwal start
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mulai',
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextField(
                                controller: TextEditingController(
                                    text: jadwalMulai != null
                                        ? formatter.format(jadwalMulai!)
                                        : ""),
                                onTap: () async {
                                  showDatePicker(
                                    context: context,
                                    initialDate: jadwalMulai ?? DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                  ).then((value) {
                                    if (value != null &&
                                        value != DateTime.now()) {
                                      setState(() {
                                        jadwalMulai = value;
                                      });
                                    }
                                  });
                                },
                                mouseCursor: SystemMouseCursors.click,
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.25,
                                  letterSpacing: -0.24,
                                ),
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black)),
                                  suffixIcon: Icon(
                                    Icons.calendar_month_outlined,
                                    color: Color(0xFFA80063),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'sampai',
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextField(
                                controller: TextEditingController(
                                    text: jadwalSampai != null
                                        ? formatter.format(jadwalSampai!)
                                        : ""),
                                onTap: () async {
                                  showDatePicker(
                                    context: context,
                                    initialDate: jadwalSampai ?? DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2050),
                                  ).then((value) {
                                    if (value != null &&
                                        value != DateTime.now()) {
                                      setState(() {
                                        jadwalSampai = value;
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
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black)),
                                  suffixIcon: Icon(
                                    Icons.calendar_month_outlined,
                                    color: Color(0xFFA80063),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // jadwal end
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
                              if (widget.pengalaman?.id != null) {
                                context.read<PengalamanBloc>().add(
                                    PutPengalaman(
                                        id: widget.pengalaman!.id,
                                        posisiPekerjaan: posisi.text,
                                        jenisPekerjaan: jenisPekerjaan.text,
                                        namaPerusahaan: namaPerusahaan.text,
                                        mulai: jadwalMulai!
                                            .add(const Duration(days: 1))
                                            .toString(),
                                        sampai: jadwalSampai!
                                            .add(const Duration(days: 1))
                                            .toString()));
                              } else {
                                context.read<PengalamanBloc>().add(
                                    PostPengalaman(
                                        posisiPekerjaan: posisi.text,
                                        jenisPekerjaan: jenisPekerjaan.text,
                                        namaPerusahaan: namaPerusahaan.text,
                                        mulai: jadwalMulai.toString(),
                                        sampai: jadwalSampai.toString()));
                              }
                              // context.goNamed("$halaman");
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
