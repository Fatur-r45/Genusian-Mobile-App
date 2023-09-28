import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/sertitifikat.dart';

class SertifikatServices {
  static Future<List<SertifikatModel>> getSertifikat(int nim) async {
    List<SertifikatModel> sertifikat = [];
    try {
      var response = await Dio().get("http://localhost:5000/sertifikat/$nim");
      List data = ((response.data) as Map<String, dynamic>)["data"];
      for (var d in data) {
        sertifikat.add(SertifikatModel(
          id: d["id"],
          kdSertifikat: d["kd_sertifikat"],
          title: d["title"],
          namaAcara: d["nama_acara"],
          keterangan: d["keterangan"],
          pdf: d["pdf"],
          tanggalDapat: DateTime.parse(d["tanggal_dapat"]),
        ));
      }
    } catch (_) {}
    return sertifikat;
  }

  static Future<void> postSertifikat(
      {required String penghargaan,
      required String kategori,
      required String penerbit,
      required String fileName,
      required String filePath,
      required String tanggalDapat,
      required String point}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? nim = pref.getInt("nim");
    final formData = FormData.fromMap(
      {
        "title": penghargaan,
        "nama_acara": kategori,
        "keterangan": penerbit,
        "pdf": await MultipartFile.fromFile(filePath, filename: fileName),
        "tanggal_dapat": tanggalDapat,
        "point": point,
      },
    );
    try {
      Response response = await Dio().post(
          "http://localhost:5000/sertifikat/$nim",
          data: formData,
          options: Options(contentType: Headers.multipartFormDataContentType),
          onSendProgress: (int sent, int total) {
        print("$sent, $total");
      });
      if (response.statusCode == 200) {
        print(response.data);
      } else {
        print('File upload failed');
      }
    } on DioException catch (e) {
      print('Error: $e');
    }
  }

  static Future<void> putSertifikat({
    required int id,
    required String penghargaan,
    required String kategori,
    required String penerbit,
    required String fileName,
    required String filePath,
    required String tanggalDapat,
  }) async {
    final formData = FormData.fromMap(
      {
        "title": penghargaan,
        "nama_acara": kategori,
        "keterangan": penerbit,
        "pdf": filePath != ""
            ? await MultipartFile.fromFile(filePath, filename: fileName)
            : "",
        "tanggal_dapat": tanggalDapat,
      },
    );
    try {
      Response response = await Dio().put(
          "http://localhost:5000/sertifikat/$id",
          data: formData,
          options: Options(contentType: Headers.multipartFormDataContentType),
          onSendProgress: (int sent, int total) {
        print("$sent, $total");
      });
      if (response.statusCode == 200) {
        print(response.data);
      } else {
        print('File upload failed');
      }
    } on DioException catch (e) {
      print('Error: $e');
    }
  }

  static Future<void> deletSertifikat(int id) async {
    try {
      await Dio().delete("http://localhost:5000/sertifikat/$id");
    } catch (_) {}
  }
}
