import 'package:dio/dio.dart';

import '../model/jenis_sertifikat.dart';

class JensiSertifikatServices {
  static Future<List<JenisSertifikat>> getJenisSertifikat() async {
    List<JenisSertifikat> jenisSertifikat = [];
    try {
      var response = await Dio().get("http://localhost:5000/jenis_sertifikat");
      List data = ((response.data) as Map<String, dynamic>)["data"];
      for (var d in data) {
        jenisSertifikat.add(JenisSertifikat(
          id: d["id"],
          jenis: d["jenis"],
          point: d["point"],
        ));
      }
    } catch (_) {}
    return jenisSertifikat;
  }
}
