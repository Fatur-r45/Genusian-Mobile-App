import 'package:equatable/equatable.dart';
import 'package:genusian_smart_mobile_app/model/pengalaman.dart';

class PengalamanState extends Equatable {
  const PengalamanState();

  @override
  List<Object> get props => [];
}

class PengalamanInitial extends PengalamanState {}

class PengalamanLoadState extends PengalamanState {
  final List<PengalamanModel> pengalaman;

  const PengalamanLoadState(this.pengalaman);

  @override
  List<Object> get props => [pengalaman];
}

class PengalamanPostState extends PengalamanState {
  @override
  List<Object> get props => [];
}

class PengalamanDelet extends PengalamanState {
  @override
  List<Object> get props => [];
}

class PengalamanPutState extends PengalamanState {
  @override
  List<Object> get props => [];
}
