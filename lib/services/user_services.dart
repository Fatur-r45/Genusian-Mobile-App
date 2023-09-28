import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/users.dart';

abstract class Services {
  static Future<User?> refreshToken(String token) async {
    try {
      // var response = await Dio().get("http://localhost:5000/token", data: {
      //   "token": token,
      // });
      // var decoded = JwtDecoder.decode(response.data["accessToken"]);
      var decoded = JwtDecoder.decode(token);
      // print(decoded);
      SharedPreferences pref = await SharedPreferences.getInstance();
      // if (response.statusCode == 200) {
      pref.setInt("nim", decoded["nim"]);
      return User(
          name: decoded["user_name"].toString(),
          nim: decoded["nim"],
          // expire: decoded["exp"],
          token: token);
      // }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<String?> getToken(
      {required String email, required String password}) async {
    try {
      var response = await Dio().post(
        "http://localhost:5000/login",
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        // print(response.data["refreshToken"]);
        return response.data["refreshToken"];
      }
    } on DioException catch (error) {
      print(error.response?.data["msg"]);
    }
    return null;
  }

  static bool? isTokenValid(String token) {
    return true;
  }

  static Future<void> logout(String token) async {
    try {
      await Dio().delete("http://localhost:5000/logout", data: {
        "token": token,
      });
    } on DioException catch (e) {
      print(e.response!.data);
    }
  }

  static Future<void> creatUser(
      {required String name,
      required String email,
      required String nim,
      required String password,
      required String confPassword}) async {
    try {
      var response = await Dio().post("http://localhost:5000/users", data: {
        "user_name": name,
        "nim": nim,
        "email": email,
        "password": password,
        "confPassword": confPassword,
      });
      await Dio().post("http://localhost:5000/mahasiswa",
          data: {"nim": nim, "point": 0});
      print(response.data);
    } on DioException catch (error) {
      print(error.response);
    }
  }
}
