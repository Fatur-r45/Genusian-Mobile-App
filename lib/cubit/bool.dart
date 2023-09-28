import "package:flutter_bloc/flutter_bloc.dart";

class AboutCubit extends Cubit<bool> {
  AboutCubit() : super(false);

  void isAbout() => emit(!state);
}

class ObscurePassowrd extends Cubit<bool> {
  ObscurePassowrd() : super(false);

  // ignore: prefer_if_null_operators
  void isObscure() => emit(!state);
}
