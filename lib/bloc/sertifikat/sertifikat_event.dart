import 'package:equatable/equatable.dart';

class SertifikatEvent extends Equatable {
  const SertifikatEvent();

  @override
  List<Object> get props => [];
}

class LoadSertifikatEvent extends SertifikatEvent {
  @override
  List<Object> get props => [];
}

class PostSertifikatEvent extends SertifikatEvent {
  final String penghargaan;
  final String kategori;
  final String penerbit;
  final String fileName;
  final String filePath;
  final String tanggalDapat;
  final String point;

  const PostSertifikatEvent(
      {required this.penghargaan,
      required this.kategori,
      required this.penerbit,
      required this.fileName,
      required this.filePath,
      required this.tanggalDapat,
      required this.point});
  @override
  List<Object> get props => [
        penghargaan,
        kategori,
        penerbit,
        fileName,
        filePath,
        tanggalDapat,
        point
      ];
}

class PutSertifikatEvent extends SertifikatEvent {
  final int id;
  final String penghargaan;
  final String kategori;
  final String penerbit;
  final String fileName;
  final String filePath;
  final String tanggalDapat;

  const PutSertifikatEvent({
    required this.id,
    required this.penghargaan,
    required this.kategori,
    required this.penerbit,
    required this.fileName,
    required this.filePath,
    required this.tanggalDapat,
  });
  @override
  List<Object> get props => [
        id,
        penghargaan,
        kategori,
        penerbit,
        fileName,
        filePath,
        tanggalDapat,
      ];
}

class DeleteSertifikatEvent extends SertifikatEvent {
  final int id;

  const DeleteSertifikatEvent(this.id);
  @override
  List<Object> get props => [id];
}
