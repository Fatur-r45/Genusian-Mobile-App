class PendidikanModel {
  int id;
  int kdPendidikan;
  String namaInstansi;
  String gelar;
  String bidangStudi;
  DateTime mulai;
  DateTime sampai;

  PendidikanModel({
    required this.id,
    required this.kdPendidikan,
    required this.namaInstansi,
    required this.gelar,
    required this.bidangStudi,
    required this.mulai,
    required this.sampai,
  });
}
