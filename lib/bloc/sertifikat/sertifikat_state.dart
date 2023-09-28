import 'package:equatable/equatable.dart';

import '../../model/sertitifikat.dart';

class SertifikatState extends Equatable {
  const SertifikatState();

  @override
  List<Object> get props => [];
}

class SertifikatInitial extends SertifikatState {}

class SertifikatLoadstate extends SertifikatState {
  final List<SertifikatModel> sertifikat;

  const SertifikatLoadstate(this.sertifikat);
  @override
  List<Object> get props => [sertifikat];
}

class SertifikatPostState extends SertifikatState {
  @override
  List<Object> get props => [];
}

class SertifikatPutState extends SertifikatState {
  @override
  List<Object> get props => [];
}

class SertifikatDeleteState extends SertifikatState {
  @override
  List<Object> get props => [];
}
