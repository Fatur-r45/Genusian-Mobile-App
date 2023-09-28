import 'package:equatable/equatable.dart';

sealed class PengalamanEvent extends Equatable {
  const PengalamanEvent();

  @override
  List<Object> get props => [];
}

class LoadPengalaman extends PengalamanEvent {
  @override
  List<Object> get props => [];
}

class PostPengalaman extends PengalamanEvent {
  final String posisiPekerjaan;
  final String jenisPekerjaan;
  final String namaPerusahaan;
  final String mulai;
  final String sampai;

  const PostPengalaman(
      {required this.posisiPekerjaan,
      required this.jenisPekerjaan,
      required this.namaPerusahaan,
      required this.mulai,
      required this.sampai});

  @override
  List<Object> get props =>
      [posisiPekerjaan, jenisPekerjaan, namaPerusahaan, mulai, sampai];
}

class PutPengalaman extends PengalamanEvent {
  final int id;
  final String posisiPekerjaan;
  final String jenisPekerjaan;
  final String namaPerusahaan;
  final String mulai;
  final String sampai;

  const PutPengalaman(
      {required this.id,
      required this.posisiPekerjaan,
      required this.jenisPekerjaan,
      required this.namaPerusahaan,
      required this.mulai,
      required this.sampai});

  @override
  List<Object> get props =>
      [id, posisiPekerjaan, jenisPekerjaan, namaPerusahaan, mulai, sampai];
}

class DeletPengalaman extends PengalamanEvent {
  final int id;

  const DeletPengalaman(this.id);
  @override
  List<Object> get props => [id];
}
