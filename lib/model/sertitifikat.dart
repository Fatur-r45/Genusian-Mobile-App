class SertifikatModel {
  int id;
  int kdSertifikat;
  String title;
  String namaAcara;
  String keterangan;
  String pdf;
  DateTime tanggalDapat;

  SertifikatModel({
    required this.id,
    required this.kdSertifikat,
    required this.title,
    required this.namaAcara,
    required this.keterangan,
    required this.pdf,
    required this.tanggalDapat,
  });
}
