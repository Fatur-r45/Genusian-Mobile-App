import 'package:genusian_smart_mobile_app/model/pendidikan_model.dart';
import 'package:genusian_smart_mobile_app/model/pengalaman.dart';
import 'package:genusian_smart_mobile_app/model/sertitifikat.dart';

class AllDataMahasiswa {
  final String nama;
  final String jurusan;
  final int rank;
  final int point;
  final String aboutMe;
  final String tempatLahir;
  final DateTime tanggalLahir;
  final int nim;
  final List<SertifikatModel> sertifikats;
  final List<PengalamanModel> pengalamans;
  final List<PendidikanModel> pendidikans;

  AllDataMahasiswa(
      {required this.nama,
      required this.jurusan,
      required this.rank,
      required this.point,
      required this.aboutMe,
      required this.tempatLahir,
      required this.tanggalLahir,
      required this.nim,
      required this.sertifikats,
      required this.pengalamans,
      required this.pendidikans});
}
