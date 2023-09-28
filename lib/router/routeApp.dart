import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/model/get_all_data_from_mahasiswa.dart';
import 'package:genusian_smart_mobile_app/model/mahasiswa.dart';
import 'package:genusian_smart_mobile_app/model/pendidikan_model.dart';
import 'package:genusian_smart_mobile_app/model/pengalaman.dart';
import 'package:genusian_smart_mobile_app/page/testing.dart';
import 'package:go_router/go_router.dart';
import 'package:genusian_smart_mobile_app/page/pages.dart';

import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_state.dart';
import '../model/sertitifikat.dart';

// import '../bloc/auth/auth_bloc.dart';
// import '../bloc/auth/auth_state.dart';

class RouterApp {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/login",
        name: "login",
        builder: (context, state) => Login(),
        redirect: (context, state) {
          UserBloc user = context.read<UserBloc>();
          if (user.state is UserSignedIn) {
            // context.goNamed("main_page");
            return "/";
          }
          return null;
        },
      ),
      GoRoute(
        path: "/test",
        name: "test",
        builder: (context, state) => Testing(),
      ),
      GoRoute(
        path: "/register",
        name: "register",
        builder: (context, state) => const Register(),
      ),
      GoRoute(
        path: "/",
        name: "main_page",
        builder: (context, state) => MainPage(),
        redirect: (context, state) {
          UserBloc user = context.read<UserBloc>();
          if (user.state is UserSignedOut) {
            return "/login";
          }
          // BlocListener<UserBloc, UserState>(
          //   listener: (context, state) {
          //     state is UserSignedOut ? Login() : MainPage();
          //   },
          // );
          return null;
        },
        routes: [
          GoRoute(
            path: "preview_profile/:nama",
            name: "preview",
            builder: (context, state) {
              String nama = state.pathParameters["nama"] ?? "No Name";
              Object? data = state.extra;
              if (data != null && data is AllDataMahasiswa) {
                return PreviewProfile(
                  mahasiswa: data,
                  nama: nama,
                );
              } else {
                return MainPage();
              }
            },
          ),
          GoRoute(
            path: "search",
            name: "search",
            builder: (context, state) => const SearchPage(),
          ),
          GoRoute(
              path: "setting",
              name: "setting",
              builder: (context, state) => const Setting(),
              routes: [
                GoRoute(
                  path: "edit",
                  name: "edit",
                  builder: (context, state) {
                    Object? data = state.extra;
                    if (data != null && data is Mahasiswa) {
                      return EditProfile(mahasiswa: data);
                    } else {
                      return const Setting();
                    }
                  },
                ),
              ]),
          GoRoute(
              path: "pengalaman",
              name: "pengalaman",
              builder: (context, state) => const Pengalaman(),
              routes: [
                GoRoute(
                    path: "create",
                    builder: (context, state) {
                      Object? data = state.extra;
                      if (data != null && data is PengalamanModel) {
                        return CreatePengalaman(
                          pengalaman: data,
                        );
                      } else {
                        return const CreatePengalaman();
                      }
                    }),
              ]),
          GoRoute(
              path: "pendidikan",
              name: "pendidikan",
              builder: (context, state) => const Pendidikan(),
              routes: [
                GoRoute(
                  path: "create",
                  // name: "create",
                  builder: (context, state) {
                    Object? data = state.extra;
                    if (data != null && data is PendidikanModel) {
                      return CreatePendidikan(
                        pendidikan: data,
                      );
                    } else {
                      return const CreatePendidikan();
                    }
                  },
                )
              ]),
          GoRoute(
              path: "sertifikat",
              name: "sertifikat",
              builder: (context, state) => const Sertifikat(),
              routes: [
                GoRoute(
                  path: "create",
                  builder: (context, state) {
                    Object? data = state.extra;
                    if (data != null && data is SertifikatModel) {
                      return CreateSertifikat(
                        sertifikat: data,
                      );
                    } else {
                      return const CreateSertifikat();
                    }
                  },
                )
              ])
        ],
      )
    ],
    initialLocation: "/login",
    // debugLogDiagnostics: true,
    // redirect: (context, state) {
    //   UserBloc user = context.read<UserBloc>();
    //   if (user.state is UserSignedOut) {
    //     return "/Login";
    //   } else if (user.state is UserSignedIn) {
    //     return "/";
    //   }
    //   return null;
    // },
  );
}
