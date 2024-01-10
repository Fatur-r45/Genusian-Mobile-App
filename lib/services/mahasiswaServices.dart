import 'package:dio/dio.dart';
import 'package:genusian_smart_mobile_app/model/pendidikan_model.dart';
import 'package:genusian_smart_mobile_app/model/pengalaman.dart';
import 'package:genusian_smart_mobile_app/model/sertitifikat.dart';
import 'package:genusian_smart_mobile_app/url/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/get_all_data_from_mahasiswa.dart';
import '../model/mahasiswa.dart';

class MahasiswaServices {
  static Future<Mahasiswa?> getMahasiswa(int nim) async {
    try {
      var response = await Dio().get("${BaseUrl.url}/mahasiswa/nim/$nim");
      var data = response.data["data"];
      if (response.statusCode == 200) {
        return Mahasiswa(
          nim: data["nim"],
          nama: data["nama"] ?? "",
          jurusan: data["jurusan"] ?? "",
          aboutMe: data["tentang_saya"] ?? "",
          tempatLahir: data["tempat_lahir"] ?? "",
          tanggalLahir: data["tanggal_lahir"] != null
              ? DateTime.parse(data["tanggal_lahir"])
              : DateTime.now(),
          poin: data["point"] ?? 0,
          rank: data["rank"],
        );
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // static Future<List<Mahasiswa>>? getMahasiswaBySearch(String input) async {
  //   List<Mahasiswa> mahasiswaSearch = [];
  //   try {
  //     var response = await Dio()
  //         .get('http://localhost:5000/mahasiswa/search?keyword=$input');
  //     List data = ((response.data) as Map<String, dynamic>)["data"];

  //     for (var data in data) {
  //       mahasiswaSearch.add(Mahasiswa(
  //         nim: data["nim"],
  //         nama: data["nama"] ?? "",
  //         jurusan: data["jurusan"] ?? "",
  //         aboutMe: data["tentang_saya"] ?? "",
  //         tempatLahir: data["tempat_lahir"] ?? "",
  //         tanggalLahir: data["tanggal_lahir"] != null
  //             ? DateTime.parse(data["tanggal_lahir"])
  //             : DateTime.now(),
  //         poin: data["point"] ?? 0,
  //         rank: data["rank"],
  //       ));
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return mahasiswaSearch;
  // }

  static Future<List<AllDataMahasiswa>?> getMahasiswaBySearch(
      String input) async {
    List<AllDataMahasiswa> mahasiswa = [];
    var response =
        await Dio().get('${BaseUrl.url}/mahasiswa/search?keyword=$input');
    List data = ((response.data) as Map<String, dynamic>)["data"];

    for (var data in data) {
      List pendidikans = ((data) as Map<String, dynamic>)["pendidikans"];
      List pengalamans = ((data) as Map<String, dynamic>)["pengalamans"];
      List sertifikats = ((data) as Map<String, dynamic>)["sertifikats"];
      mahasiswa.add(AllDataMahasiswa(
        nim: data["nim"],
        nama: data["nama"] ?? "",
        jurusan: data["jurusan"] ?? "",
        aboutMe: data["tentang_saya"] ?? "",
        tempatLahir: data["tempat_lahir"] ?? "",
        tanggalLahir: data["tanggal_lahir"] != null
            ? DateTime.parse(data["tanggal_lahir"])
            : DateTime.now(),
        point: data["point"] ?? 0,
        rank: data["rank"],
        pendidikans: pendidikans.isNotEmpty
            ? List<PendidikanModel>.from(
                pendidikans.map(
                  (x) => PendidikanModel(
                      id: x["id"],
                      kdPendidikan: x["kd_pendidikan"],
                      namaInstansi: x["nama_instansi"],
                      gelar: x["gelar"],
                      bidangStudi: x["bidang_studi"],
                      mulai: DateTime.parse(x["mulai"]),
                      sampai: DateTime.parse(x["sampai"])),
                ),
              )
            : [],
        pengalamans: List<PengalamanModel>.from(
          pengalamans.map(
            (x) => PengalamanModel(
              id: x["id"],
              kdPengalaman: x["kd_pengalaman"],
              posisiPekerjaan: x["posisi_pekerjaan"],
              namaPerusahaan: x["nama_perusahaan"],
              jenisPekerjaan: x["jenis_pekerjaan"],
              mulai: DateTime.parse(x["mulai"]),
              sampai: DateTime.parse(x["sampai"]),
            ),
          ),
        ),
        sertifikats: List<SertifikatModel>.from(
          sertifikats.map(
            (d) => SertifikatModel(
              id: d["id"],
              kdSertifikat: d["kd_sertifikat"],
              title: d["title"],
              namaAcara: d["nama_acara"],
              keterangan: d["keterangan"],
              pdf: d["pdf"],
              tanggalDapat: DateTime.parse(d["tanggal_dapat"]),
            ),
          ),
        ),
      ));
    }
    return mahasiswa;
  }

  static Future<void> putMahasiswa(String nama, String jurusan,
      String tempatLahir, String tanggalLahir) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? nim = pref.getInt("nim");
    try {
      var response = await Dio().put("${BaseUrl.url}/mahasiswa/$nim", data: {
        "nama": nama,
        "jurusan": jurusan,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": tanggalLahir,
      });
      // await Dio().put("http://localhost:5000/mahasiswa/$nim", data: {
      //   "nama": nama,
      //   "jurusan": jurusan,
      // });
      if (response.statusCode == 200) {
        print(response.data["message"]);
      }
    } on DioException catch (e) {
      print("error anda: ${e.response!.data["message"]}");
    }
  }

  static Future<void> putAboutMe(String aboutMe) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? nim = pref.getInt("nim");
    try {
      // var response =
      //     await Dio().put("http://localhost:5000/mahasiswa/$nim", data: {
      //   "tentang_saya": aboutMe,
      // });
      await Dio().put("${BaseUrl.url}/mahasiswa/$nim", data: {
        "tentang_saya": aboutMe,
      });
    } on DioException catch (e) {
      // print(e.response?.data["msg"]);
      print("error broh:$e");
    }
  }
}
