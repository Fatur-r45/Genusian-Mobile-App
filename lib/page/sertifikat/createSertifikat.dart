import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/model/sertitifikat.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../bloc/sertifikat/sertifikat_bloc.dart';
import '../../bloc/sertifikat/sertifikat_event.dart';
import '../../bloc/sertifikat/sertifikat_state.dart';
import '../../components/form_input.dart';
import '../../helper/capital_words.dart';
import '../../model/jenis_sertifikat.dart';
import '../../services/jenissertifikat_services.dart';
import '../../services/serviceFile.dart';

class CreateSertifikat extends StatefulWidget {
  final SertifikatModel? sertifikat;

  const CreateSertifikat({super.key, this.sertifikat});
  @override
  State<CreateSertifikat> createState() => _CreateSertifikatState();
}

class _CreateSertifikatState extends State<CreateSertifikat> {
  DateTime? jadwalMulai;
  final penghargaan = TextEditingController();
  JenisSertifikat? kategori;
  final penerbit = TextEditingController();
  String? fileName;
  String? filePath;
  String? prevFileName;
  List<JenisSertifikat>? jenisSertifikat;

  @override
  void initState() {
    super.initState();
    getAllSertifikat();
    if (widget.sertifikat != null) {
      setState(() {
        jadwalMulai = widget.sertifikat!.tanggalDapat;
        penghargaan.text = widget.sertifikat!.title;
        kategori = JenisSertifikat(
            id: widget.sertifikat!.id,
            jenis: widget.sertifikat!.namaAcara,
            point: 0);
        penerbit.text = widget.sertifikat!.keterangan;
        prevFileName = widget.sertifikat!.pdf.split("/").last;
      });
    }
  }

  Future<void> getAllSertifikat() async {
    List<JenisSertifikat> data =
        await JensiSertifikatServices.getJenisSertifikat();
    setState(() {
      jenisSertifikat = data;
    });
  }

  void uploadImage() async {
    ServiceFile? path = await ServiceFile.uploadFile();
    if (path != null) {
      setState(() {
        fileName = path.fileName.split("'")[1];
        filePath = path.filePath;
      });
    }
  }

  final DateFormat formatter = DateFormat('dd MMMM yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 70,
        forceMaterialTransparency: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: BlocListener<SertifikatBloc, SertifikatState>(
        listener: (context, state) {
          if (state is SertifikatPostState || state is SertifikatPutState) {
            context.read<SertifikatBloc>().add(LoadSertifikatEvent());
          }
          // if (state is SertifikatPutState) {
          //   context.read<SertifikatBloc>().add(LoadSertifikatEvent());
          // }
        },
        child: BlocBuilder<SertifikatBloc, SertifikatState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Penghargaan pekerjaan start
                      FormInput(
                        label: 'Nama Penghargaan',
                        hint: 'Contoh : Public Speaking',
                        controler: penghargaan,
                      ),
                      // Penghargaan pekerjaan end
                      // Nama Perusahaan start
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kategori/Prestasi yang Diraih",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DropdownSearch<JenisSertifikat>(
                              popupProps: const PopupProps.menu(
                                fit: FlexFit.loose,
                              ),
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                  baseStyle: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.25,
                                    letterSpacing: -0.24,
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  dropdownSearchDecoration:
                                      const InputDecoration(
                                          border: UnderlineInputBorder())),
                              items: jenisSertifikat
                                      ?.map(
                                        (e) => JenisSertifikat(
                                            id: e.id,
                                            jenis: e.jenis,
                                            point: e.point),
                                      )
                                      .toList() ??
                                  [],
                              selectedItem: kategori,
                              itemAsString: (item) =>
                                  Kapital.capitalizeWords(item.jenis),
                              onChanged: (JenisSertifikat? data) {
                                setState(() {
                                  kategori = data;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      // Nama Perusahaan end
                      // Jenis Pekerjaan start
                      FormInput(
                        label: "Penerbit",
                        hint: "Contoh : Universitas Nusa Putra",
                        controler: penerbit,
                      ),
                      // Jenis Pekerjaan end
                      // jadwal start
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tanggal Terbit',
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
                      // jadwal end
                      // form file start
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Masukkan File Bentuk Pdf',
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.25,
                                letterSpacing: -0.24,
                              ),
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Row(
                              children: [
                                OutlinedButton(
                                  style: ButtonStyle(
                                    padding: const MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(horizontal: 24)),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4))),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                      Color(0xFFEEEEEE),
                                    ),
                                  ),
                                  onPressed: () {
                                    uploadImage();
                                  },
                                  child: Text(
                                    'Pilih File',
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 1.43,
                                      letterSpacing: -0.24,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Text(
                                    fileName != null
                                        ? fileName.toString()
                                        : prevFileName != null
                                            ? prevFileName.toString()
                                            : 'Tidak ada file yang dipilih',
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 1.43,
                                      letterSpacing: -0.24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // form file end
                      // button start
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xffA80063)),
                                  padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(vertical: 24),
                                  ),
                                ),
                                onPressed: () {
                                  if (widget.sertifikat?.id != null) {
                                    context
                                        .read<SertifikatBloc>()
                                        .add(PutSertifikatEvent(
                                          id: widget.sertifikat!.id,
                                          penghargaan: penghargaan.text,
                                          kategori: kategori?.jenis ?? "",
                                          penerbit: penerbit.text,
                                          filePath: filePath ?? "",
                                          fileName: fileName ?? "",
                                          tanggalDapat: jadwalMulai != null
                                              ? jadwalMulai!
                                                  .add(const Duration(days: 1))
                                                  .toString()
                                              : "",
                                        ));
                                  } else {
                                    context
                                        .read<SertifikatBloc>()
                                        .add(PostSertifikatEvent(
                                          penghargaan: penghargaan.text,
                                          kategori: kategori?.jenis ?? "",
                                          penerbit: penerbit.text,
                                          filePath: filePath ?? "",
                                          fileName: fileName ?? "",
                                          tanggalDapat: jadwalMulai != null
                                              ? jadwalMulai!
                                                  .add(const Duration(days: 1))
                                                  .toString()
                                              : "",
                                          point:
                                              kategori?.point.toString() ?? "",
                                        ));
                                  }
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.success,
                                    title: "Success",
                                    desc: "sertifikat berhasil ditambahkan",
                                    animType: AnimType.scale,
                                  ).show();
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    context.goNamed("sertifikat");
                                  });
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

                      // button end
                    ],
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
