import 'package:dio/dio.dart';

import '../model/pendidikan_model.dart';

class PendidikanServices {
  static Future<List<PendidikanModel>?> getAllPendidikan(int nim) async {
    List<PendidikanModel> pendidikan = [];
    try {
      var response = await Dio().get("http://localhost:5000/pendidikan/${nim}");
      List data = ((response.data) as Map<String, dynamic>)["data"];
      for (var data in data) {
        pendidikan.add(PendidikanModel(
          id: data["id"],
          kdPendidikan: data["kd_pendidikan"],
          namaInstansi: data["nama_instansi"],
          gelar: data["gelar"],
          bidangStudi: data["bidang_studi"],
          mulai: DateTime.parse(data["mulai"]),
          sampai: DateTime.parse(data["sampai"]),
        ));
      }
    } catch (_) {}
    return pendidikan;
  }

  static Future<void> postPendidikan({
    required int nim,
    required String namaInstansi,
    required String gelar,
    required String bidangStudi,
    required String mulai,
    required String sampai,
  }) async {
    try {
      var response =
          await Dio().post("http://localhost:5000/pendidikan/$nim", data: {
        "nama_instansi": namaInstansi,
        "gelar": gelar,
        "bidang_studi": bidangStudi,
        "mulai": mulai,
        'sampai': sampai,
      });
      if (response.statusCode == 200) {
        print("data Berhasil ditambahkan");
      }
    } catch (_) {}
  }

  static Future<void> putPendidikan({
    required int id,
    required String namaInstansi,
    required String gelar,
    required String bidangStudi,
    required String mulai,
    required String sampai,
  }) async {
    try {
      var response =
          await Dio().put("http://localhost:5000/pendidikan/$id", data: {
        "nama_instansi": namaInstansi,
        "gelar": gelar,
        "bidang_studi": bidangStudi,
        "mulai": mulai,
        'sampai': sampai,
      });

      if (response.statusCode == 200) {
        print("data berhasil di ubah");
      }
    } on DioException catch (error) {
      print(error.response?.data["msg"]);
    }
  }

  static Future<void> deletPendidikan(int id) async {
    try {
      await Dio().delete("http://localhost:5000/pendidikan/$id");
    } catch (_) {}
  }
}
