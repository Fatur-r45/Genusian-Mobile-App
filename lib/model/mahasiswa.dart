import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

@immutable
class Mahasiswa {
  final int nim, poin, rank;
  final String nama, jurusan, aboutMe, tempatLahir;
  final DateTime? tanggalLahir;

  const Mahasiswa(
      {required this.nim,
      required this.nama,
      required this.jurusan,
      required this.aboutMe,
      required this.tempatLahir,
      required this.tanggalLahir,
      required this.poin,
      required this.rank});

  static Future<List<Mahasiswa>>? getAllMahasiswa() async {
    List<Mahasiswa> allMahasiswa = [];
    try {
      var response = await Dio().get('http://localhost:5000/mahasiswa');
      List data = ((response.data) as Map<String, dynamic>)["data"];

      for (var data in data) {
        allMahasiswa.add(Mahasiswa(
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
        ));
      }
    } catch (e) {
      print(e);
    }
    return allMahasiswa;
  }
}

class SearchMahasiswa {
  final int nim;
  final String nama;
  final String aboutMe;
  final String jurusan;

  SearchMahasiswa(
      {required this.nim,
      required this.nama,
      required this.aboutMe,
      required this.jurusan});
}
