import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../bloc/pendidikan/pendidikan_bloc.dart';
import '../../components/form_input.dart';
import '../../model/pendidikan_model.dart';

class CreatePendidikan extends StatefulWidget {
  final PendidikanModel? pendidikan;
  const CreatePendidikan({super.key, this.pendidikan});

  @override
  State<CreatePendidikan> createState() => _CreatePendidikanState();
}

class _CreatePendidikanState extends State<CreatePendidikan> {
  DateTime? jadwalMulai;
  DateTime? jadwalSampai;
  final DateFormat formatter = DateFormat('dd MMMM yyyy');
  final namaInstansi = TextEditingController();
  final gelar = TextEditingController();
  final bidangStudi = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.pendidikan != null) {
      setState(() {
        jadwalMulai = widget.pendidikan!.mulai;
        jadwalSampai = widget.pendidikan!.sampai;
        namaInstansi.text = widget.pendidikan!.namaInstansi;
        gelar.text = widget.pendidikan!.gelar;
        bidangStudi.text = widget.pendidikan!.bidangStudi;
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
      body: BlocListener<PendidikanBloc, PendidikanState>(
        listener: (context, state) {
          if (state is PendidikanPostState || state is PendidikanPutState) {
            context.read<PendidikanBloc>().add(LoadPendidikanEvent());
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // posisi pekerjaan start
              FormInput(
                label: 'Nama Instansi',
                hint: 'Contoh : Universitas Nusa Putra',
                controler: namaInstansi,
              ),
              // posisi pekerjaan end
              // Nama Perusahaan start
              FormInput(
                label: "Gelar",
                hint: "Contoh : Sarjana",
                controler: gelar,
              ),
              // Nama Perusahaan end
              // Jenis Pekerjaan start
              FormInput(
                hint: "Contoh : Sistem Informasi",
                label: "Bidang Studi",
                controler: bidangStudi,
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
                                // setState(() {
                                //   jadwalMulai = value!;
                                // });
                                if (value != null && value != DateTime.now()) {
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
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365 * 4)),
                              ).then((value) {
                                if (value != null && value != DateTime.now()) {
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
                          if (widget.pendidikan?.id != null) {
                            context.read<PendidikanBloc>().add(
                                PutPendidikanEvent(
                                    id: widget.pendidikan!.id,
                                    namaInstansi: namaInstansi.text,
                                    gelar: gelar.text,
                                    bidangStudi: bidangStudi.text,
                                    mulai: jadwalMulai!
                                        .add(const Duration(days: 1))
                                        .toString(),
                                    sampai: jadwalSampai!
                                        .add(const Duration(days: 1))
                                        .toString()));
                          } else {
                            context.read<PendidikanBloc>().add(
                                PostPendidikanEvent(
                                    namaInstansi: namaInstansi.text,
                                    gelar: gelar.text,
                                    bidangStudi: bidangStudi.text,
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
        ),
      ),
    );
  }
}
