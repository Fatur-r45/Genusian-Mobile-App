part of 'pendidikan_bloc.dart';

sealed class PendidikanState extends Equatable {
  const PendidikanState();

  @override
  List<Object> get props => [];
}

final class PendidikanInitial extends PendidikanState {
  @override
  List<Object> get props => [];
}

final class PendidikanLoadState extends PendidikanState {
  final List<PendidikanModel> pendidikan;

  const PendidikanLoadState(this.pendidikan);
  @override
  List<Object> get props => [pendidikan];
}

final class PendidikanPostState extends PendidikanState {
  @override
  List<Object> get props => [];
}

final class PendidikanPutState extends PendidikanState {
  @override
  List<Object> get props => [];
}

final class PendidikanDeleteState extends PendidikanState {
  @override
  List<Object> get props => [];
}
