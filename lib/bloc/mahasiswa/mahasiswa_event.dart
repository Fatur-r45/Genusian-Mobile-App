import 'package:equatable/equatable.dart';

class MahasiswaEvent extends Equatable {
  const MahasiswaEvent();

  @override
  List<Object> get props => [];
}

class LoadMahasiswa extends MahasiswaEvent {
  @override
  List<Object> get props => [];
}

class UpdateAboutMe extends MahasiswaEvent {
  final String aboutMe;

  const UpdateAboutMe(this.aboutMe);
  @override
  List<Object> get props => [aboutMe];
}

class EditMahasiswa extends MahasiswaEvent {
  final String nama, jurusan, tempatLahir, tanggalLahir;

  const EditMahasiswa(
      {required this.nama,
      required this.jurusan,
      required this.tempatLahir,
      required this.tanggalLahir});

  @override
  List<Object> get props => [nama, jurusan, tempatLahir, tanggalLahir];
}

class SearchMahasiswaEvent extends MahasiswaEvent {
  final String input;

  const SearchMahasiswaEvent(this.input);
  @override
  List<Object> get props => [];
}
