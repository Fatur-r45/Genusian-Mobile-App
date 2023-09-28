import 'package:dio/dio.dart';

import '../model/pengalaman.dart';

class PengalamanServices {
  static Future<List<PengalamanModel>?> getAllPengalaman(int nim) async {
    List<PengalamanModel> pengalaman = [];
    try {
      var response = await Dio().get("http://localhost:5000/pengalaman/${nim}");
      List data = ((response.data) as Map<String, dynamic>)["data"];
      for (var data in data) {
        pengalaman.add(PengalamanModel(
          id: data["id"],
          kdPengalaman: data["kd_pengalaman"],
          posisiPekerjaan: data["posisi_pekerjaan"],
          namaPerusahaan: data["nama_perusahaan"],
          jenisPekerjaan: data["jenis_pekerjaan"],
          mulai: DateTime.parse(data["mulai"]),
          sampai: DateTime.parse(data["sampai"]),
        ));
      }
    } catch (e) {
      rethrow;
    }
    return pengalaman;
  }

  static Future<void> postPengalaman(
      int nim,
      String posisiPekerjaan,
      String jenisPekerjaan,
      String namaPerusahaan,
      String mulai,
      String sampai) async {
    try {
      await Dio().post("http://localhost:5000/pengalaman/$nim", data: {
        "posisi_pekerjaan": posisiPekerjaan,
        "jenis_pekerjaan": jenisPekerjaan,
        "nama_perusahaan": namaPerusahaan,
        "mulai": mulai,
        "sampai": sampai,
      });
    } catch (_) {}
  }

  static Future<void> putPengalaman(
      int id,
      String posisiPekerjaan,
      String jenisPekerjaan,
      String namaPerusahaan,
      String mulai,
      String sampai) async {
    try {
      await Dio().put("http://localhost:5000/pengalaman/$id", data: {
        "posisi_pekerjaan": posisiPekerjaan,
        "jenis_pekerjaan": jenisPekerjaan,
        "nama_perusahaan": namaPerusahaan,
        "mulai": mulai,
        "sampai": sampai,
      });
    } on DioException catch (error) {
      print(error.response?.data["msg"]);
    }
  }

  static Future<void> deletPengalaman(int id) async {
    try {
      await Dio().delete("http://localhost:5000/pengalaman/${id}");
    } catch (_) {}
  }
}
