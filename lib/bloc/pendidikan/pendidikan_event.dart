part of 'pendidikan_bloc.dart';

sealed class PendidikanEvent extends Equatable {
  const PendidikanEvent();

  @override
  List<Object> get props => [];
}

final class LoadPendidikanEvent extends PendidikanEvent {
  @override
  List<Object> get props => [];
}

final class PostPendidikanEvent extends PendidikanEvent {
  final String namaInstansi;
  final String gelar;
  final String bidangStudi;
  final String mulai;
  final String sampai;

  const PostPendidikanEvent(
      {required this.namaInstansi,
      required this.gelar,
      required this.bidangStudi,
      required this.mulai,
      required this.sampai});
  @override
  List<Object> get props => [namaInstansi, gelar, bidangStudi, mulai, sampai];
}

final class PutPendidikanEvent extends PendidikanEvent {
  final int id;
  final String namaInstansi;
  final String gelar;
  final String bidangStudi;
  final String mulai;
  final String sampai;

  const PutPendidikanEvent(
      {required this.id,
      required this.namaInstansi,
      required this.gelar,
      required this.bidangStudi,
      required this.mulai,
      required this.sampai});
  @override
  List<Object> get props =>
      [id, namaInstansi, gelar, bidangStudi, mulai, sampai];
}

final class DeletePendidikanEvent extends PendidikanEvent {
  final int id;

  const DeletePendidikanEvent(this.id);
  @override
  List<Object> get props => [id];
}
