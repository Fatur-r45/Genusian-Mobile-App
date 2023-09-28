import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/auth/auth_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/auth/auth_event.dart';
import 'package:genusian_smart_mobile_app/cubit/bool.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/auth/auth_state.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final FontWeight medium = FontWeight.w400;
  final FontWeight normal = FontWeight.w500;
  final FontWeight semibold = FontWeight.bold;
  final FontWeight bold = FontWeight.bold;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Text(
                  "Selamat Datang",
                  style: GoogleFonts.inter(
                      color: const Color(0xFFA80063),
                      fontSize: 24.0,
                      fontWeight: semibold),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  "Masuk dengan akun anda yang terdaftar",
                  style: GoogleFonts.inter(
                    fontSize: 16.0,
                    fontWeight: medium,
                    color: const Color(0xFF000000),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextField(
                  controller: email,
                  autocorrect: false,
                  decoration: InputDecoration(
                      label: Text("Email atau NIM",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: medium,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 24)),
                ),
                const SizedBox(height: 12),
                BlocBuilder<ObscurePassowrd, bool>(
                  builder: (context, state) {
                    return TextField(
                      controller: password,
                      autocorrect: false,
                      obscureText: state,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              context.read<ObscurePassowrd>().isObscure();
                            },
                            icon: state
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Color(0xffA80063),
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: Color(0xffA80063),
                                  ),
                          ),
                          label: Text("password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: medium,
                              )),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 24.0, horizontal: 24)),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("Lupa Kata Sandi?",
                        style: TextStyle(
                          color: const Color(0xffA80063),
                          fontSize: 16,
                          fontWeight: semibold,
                        )),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xffA80063)),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(vertical: 24)),
                        ),
                        onPressed: () {
                          context.read<UserBloc>().add(SignIn(
                              email: email.text, password: password.text));
                          // context.read<UserBloc>().add(SignIn(
                          //     email: "fatur.rahman_si19@nusaputra.ac.id",
                          //     password: "089666982058"));
                        },
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: "Belum Punya Akun?",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                              children: [
                                TextSpan(
                                  text: " Daftar Sekarang",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => context.goNamed("register"),
                                  style: GoogleFonts.inter(
                                      color: const Color(0xffA80063),
                                      fontWeight: semibold),
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
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
