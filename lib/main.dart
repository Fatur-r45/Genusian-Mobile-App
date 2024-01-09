import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/auth/auth_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/auth/auth_event.dart';
import 'package:genusian_smart_mobile_app/bloc/auth/auth_state.dart';
import 'package:genusian_smart_mobile_app/bloc/mahasiswa/mahasiswa_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/mahasiswa/mahasiswa_event.dart';
import 'package:genusian_smart_mobile_app/bloc/pendidikan/pendidikan_bloc.dart';
import 'package:genusian_smart_mobile_app/cubit/bool.dart';
import 'package:genusian_smart_mobile_app/cubit/incermentBottomNav.dart';
import 'package:genusian_smart_mobile_app/router/routeApp.dart';
import 'package:go_router/go_router.dart';

import 'bloc/pengalaman/pengalaman_bloc.dart';
import 'bloc/pengalaman/pengalaman_event.dart';
import 'bloc/sertifikat/sertifikat_bloc.dart';
import 'bloc/sertifikat/sertifikat_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = RouterApp().router;
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AboutCubit(),
          ),
          BlocProvider(
            create: (context) => ObscurePassowrd(),
          ),
          BlocProvider(
            create: (context) => IncermentBottomNav(),
          ),
          BlocProvider(
            create: (context) => UserBloc()..add(CheckSignInStatus()),
          ),
          BlocProvider(
              lazy: false,
              create: (context) => MahasiswaBloc()..add(LoadMahasiswa())),
          BlocProvider(
              lazy: false,
              create: (context) => PengalamanBloc()..add(LoadPengalaman())),
          BlocProvider(
              lazy: false,
              create: (context) =>
                  SertifikatBloc()..add(LoadSertifikatEvent())),
          BlocProvider(
              lazy: false,
              create: (context) =>
                  PendidikanBloc()..add(LoadPendidikanEvent())),
        ],
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserSignedIn) {
              router.goNamed("main_page");
              context.read<MahasiswaBloc>().add(LoadMahasiswa());
              context.read<PengalamanBloc>().add(LoadPengalaman());
              context.read<SertifikatBloc>().add(LoadSertifikatEvent());
              context.read<PendidikanBloc>().add(LoadPendidikanEvent());
              router.refresh();
            }
            if (state is UserSignedOut) {
              router.goNamed("login");
              context.read<UserBloc>().add(SignOut());
              router.refresh();
            }
          },
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                // routeInformationParser: RouterApp().router.routeInformationParser,
                // routerDelegate: RouterApp().router.routerDelegate,
                // routeInformationProvider:
                //     RouterApp().router.routeInformationProvider,
                routerConfig: router,
              );
            },
          ),
        ));
  }
}
