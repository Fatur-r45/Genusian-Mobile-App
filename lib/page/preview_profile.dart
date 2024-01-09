import 'package:flutter/material.dart';
import 'package:genusian_smart_mobile_app/components/components_items.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/get_all_data_from_mahasiswa.dart';

class PreviewProfile extends StatelessWidget {
  final AllDataMahasiswa mahasiswa;
  final String nama;
  const PreviewProfile(
      {super.key, required this.mahasiswa, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA80063),
      appBar: AppBar(
        backgroundColor: const Color(0xFFA80063),
        elevation: 0,
      ),
      body: ListView(
        children: [
          // herro section start
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 24),
            child: Container(
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
                            image: AssetImage(
                                "images/${(mahasiswa.nim).toString().split('').last}.png"),
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
                          Text(
                            nama != "" ? nama : "No Name",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.43,
                              letterSpacing: -0.24,
                            ),
                          ),
                          Text(
                            mahasiswa.jurusan != ""
                                ? mahasiswa.jurusan
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
                                image: mahasiswa.rank == 1
                                    ? const AssetImage("icons/Crown Icon.png")
                                    : const AssetImage("icons/medali.png")),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Peringkat ${mahasiswa.rank} Sekarang',
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
            ),
          ),

          // herro section start

          // Main Content
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 3 / 4,
            ),
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

                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
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
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        mahasiswa.aboutMe,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                // about me section end

                // Experience section start
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      mahasiswa.pengalamans.isNotEmpty
                          ? Column(
                              children: List.generate(
                                mahasiswa.pengalamans.length,
                                (index) => Pengalaman(
                                    posisiPekerjaan: mahasiswa
                                        .pengalamans[index].posisiPekerjaan,
                                    namaPerusahaan: mahasiswa
                                        .pengalamans[index].namaPerusahaan,
                                    jenisPekerjaan: mahasiswa
                                        .pengalamans[index].jenisPekerjaan,
                                    mulai: mahasiswa.pengalamans[index].mulai,
                                    sampai:
                                        mahasiswa.pengalamans[index].sampai),
                              ),
                            )
                          : const Center(
                              child: Text("No Data"),
                            ),
                    ],
                  ),
                ),
                // Experience section start

                // Pendidikan section start
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      // item pendidikan section start
                      mahasiswa.pendidikans.isNotEmpty
                          ? Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(
                                  mahasiswa.pendidikans.length,
                                  (index) => PendidikanItems(
                                      namaInstansi: mahasiswa
                                          .pendidikans[index].namaInstansi,
                                      bidangStudi: mahasiswa
                                          .pendidikans[index].bidangStudi,
                                      mulai: mahasiswa.pendidikans[index].mulai,
                                      sampai:
                                          mahasiswa.pendidikans[index].sampai)))
                          : const Center(child: Text("No Data")),

                      // item pendidikan section end
                    ],
                  ),
                ),
                // Pendidikan section start

                // Sertifikat section start
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      mahasiswa.sertifikats.isNotEmpty
                          ? Column(
                              children: List.generate(
                                mahasiswa.sertifikats.length,
                                (index) => SertifikatItems(
                                    title: mahasiswa.sertifikats[index].title,
                                    keterangan:
                                        mahasiswa.sertifikats[index].keterangan,
                                    tanggalDapat: mahasiswa
                                        .sertifikats[index].tanggalDapat),
                              ),
                            )
                          : const Center(child: Text("No Data")),
                    ],
                  ),
                )

                // Sertifikat section start
              ],
            ),
          )
          // Main Content end
        ],
      ),
    );
  }
}
