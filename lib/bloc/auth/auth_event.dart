import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class SignIn extends UserEvent {
  final String email;
  final String password;

  const SignIn({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignOut extends UserEvent {}

class CheckSignInStatus extends UserEvent {}

class UserCreate extends UserEvent {
  final String name, email, nim, password, confPassword;

  const UserCreate(
      {required this.name,
      required this.email,
      required this.nim,
      required this.password,
      required this.confPassword});

  @override
  List<Object> get props => [name, email, nim, password, confPassword];
}
