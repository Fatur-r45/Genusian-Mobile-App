class PengalamanModel {
  int id;
  int kdPengalaman;
  String posisiPekerjaan;
  String namaPerusahaan;
  String jenisPekerjaan;
  DateTime mulai;
  DateTime sampai;

  PengalamanModel({
    required this.id,
    required this.kdPengalaman,
    required this.posisiPekerjaan,
    required this.namaPerusahaan,
    required this.jenisPekerjaan,
    required this.mulai,
    required this.sampai,
  });
}
