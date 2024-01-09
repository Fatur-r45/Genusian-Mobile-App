import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/auth/auth_event.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/auth/auth_bloc.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController nim = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confPassword = TextEditingController();
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(height: 60),
                Text(
                  "Daftar Akun",
                  style: GoogleFonts.inter(
                      color: const Color(0xFFA80063),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  "Masukkan data anda dengan benar",
                  style: GoogleFonts.inter(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF000000),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextField(
                  controller: name,
                  autocorrect: false,
                  decoration: InputDecoration(
                      label: Text(
                        'User Name',
                        style: GoogleFonts.inter(
                          color: const Color(0xFFAAAAAA),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                          letterSpacing: -0.24,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 24)),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: email,
                  autocorrect: false,
                  decoration: InputDecoration(
                      label: Text(
                        'Email',
                        style: GoogleFonts.inter(
                          color: const Color(0xFFAAAAAA),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                          letterSpacing: -0.24,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 24)),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: nim,
                  autocorrect: false,
                  decoration: InputDecoration(
                      label: Text('NIM',
                          style: GoogleFonts.inter(
                            color: const Color(0xFFAAAAAA),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                            letterSpacing: -0.24,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 24)),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: password,
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecoration(
                      label: Text("Password",
                          style: GoogleFonts.inter(
                              color: const Color(0xFFAAAAAA),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                              letterSpacing: -0.24)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 24)),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: confPassword,
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.visibility_off,
                        color: Color(0xffA80063),
                      ),
                      label: Text("Confirm Password",
                          style: GoogleFonts.inter(
                              color: const Color(0xFFAAAAAA),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                              letterSpacing: -0.24)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 24)),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 12,),
                //   child: Text(
                //     "Kata Sandi minimal 8 - 16 huruf atau angka!",
                //     style: GoogleFonts.inter(
                //       color: const Color(0xffFF0000),
                //       fontSize: 12.0,
                //       fontWeight: normal,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 17, top: 16),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _check,
                        onChanged: (value) {
                          setState(() {
                            _check = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Flexible(
                        child: Text.rich(
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          TextSpan(
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                            text:
                                "Dengan mendaftar, Berarti Anda telah menyetujui ",
                            children: const [
                              TextSpan(
                                  text: "Perjanjian Pengguna ",
                                  style: TextStyle(color: Color(0xffA80063))),
                              TextSpan(text: "dan "),
                              TextSpan(
                                  text: "Kebijakan Privasi",
                                  style: TextStyle(color: Color(0xffA80063))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(children: [
                  Expanded(
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xffA80063)),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 24)),
                      ),
                      onPressed: () {
                        if (_check == true) {
                          context.read<UserBloc>().add(UserCreate(
                              name: name.text,
                              email: email.text,
                              nim: nim.text,
                              password: password.text,
                              confPassword: confPassword.text));
                        } else {
                          print("tolok ceklis terlebih dahulu checkbox");
                        }
                      },
                      child: const Text(
                        "Daftar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                        text: "Sudah Punya Akun?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: " Masuk Sekarang",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.goNamed("login"),
                            style: GoogleFonts.inter(
                                color: const Color(0xffA80063),
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 28, bottom: 10),
                      width: 134,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
