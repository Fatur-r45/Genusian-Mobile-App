import '../../model/get_all_data_from_mahasiswa.dart';
import '../../model/mahasiswa.dart';
import 'package:equatable/equatable.dart';

class MahasiswaState extends Equatable {
  const MahasiswaState();
  @override
  List<Object> get props => [];
}

class MahasiswaInitial extends MahasiswaState {}

class MahasiswaLoadState extends MahasiswaState {
  final Mahasiswa mahasiswa;
  final List<Mahasiswa> allMahasiswa;

  const MahasiswaLoadState(this.mahasiswa, this.allMahasiswa);

  @override
  List<Object> get props => [mahasiswa, allMahasiswa];
}

class MahasiswaLoadingState extends MahasiswaState {
  @override
  List<Object> get props => [];
}

class MahasiswaAboutState extends MahasiswaState {
  @override
  List<Object> get props => [];
}

class MahasiswaEditState extends MahasiswaState {
  @override
  List<Object> get props => [];
}

class MahasiswaSearchState extends MahasiswaState {
  final List<AllDataMahasiswa> searchMahsiswa;

  const MahasiswaSearchState(this.searchMahsiswa);
  @override
  List<Object> get props => [searchMahsiswa];
}
