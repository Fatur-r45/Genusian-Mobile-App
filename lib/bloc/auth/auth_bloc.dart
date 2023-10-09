import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/users.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserSignedOut()) {
    on<SignIn>((event, emit) async {
      try {
        if (state is UserSignedOut) {
          String? token = await Services.getToken(
              email: event.email, password: event.password);
          if (token != null) {
            User? user = await Services.refreshToken(token);
            if (user != null) {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setString("email", event.email);
              pref.setString("token", token);
              emit(UserSignedIn(user));
            }
          }
        }
      } catch (_) {}
    });
    on<SignOut>((event, emit) async {
      if (state is UserSignedIn) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        String? token = pref.getString("token");
        if (token != null) {
          try {
            pref.remove("email");
            pref.remove("nim");
            pref.remove("token");
            await Services.logout(token);

            emit(UserSignedOut());
          } catch (_) {}
        }
      }
    });
    on<UserCreate>((event, emit) async {
      await Services.creatUser(
          name: event.name,
          email: event.email,
          nim: event.nim,
          password: event.password,
          confPassword: event.confPassword);
      emit(UserCreateState());
    });
    on<CheckSignInStatus>((event, emit) async {
      try {
        SharedPreferences pref = await SharedPreferences.getInstance();
        int? nim = pref.getInt("nim");
        String? email = pref.getString("email");
        String? token = pref.getString("token");
        if (email != null && token != null && nim != null) {
          bool? tokenValid = Services.isTokenValid(token);
          if (tokenValid != false) {
            User? user = await Services.refreshToken(token);
            if (user != null) {
              emit(UserSignedIn(user));
            }
          }
        } else {
          emit(UserSignedOut());
        }
      } catch (_) {}
    });
  }
}
