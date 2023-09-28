import 'package:flutter/material.dart';

@immutable
class User {
  final String name;
  final int nim;
  // final int expire;
  final String? token;
  const User(
      {required this.name,
      required this.nim,
      // required this.expire,
      required this.token});
}
