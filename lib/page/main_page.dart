import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/components/Appbar_menu_components/AppBar_Home.dart';
import 'package:genusian_smart_mobile_app/components/Appbar_menu_components/Appbar_Profile.dart';
import 'package:genusian_smart_mobile_app/cubit/incermentBottomNav.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:genusian_smart_mobile_app/page/main_pages/main_pages.dart';

import '../bloc/mahasiswa/mahasiswa_bloc.dart';
import '../bloc/mahasiswa/mahasiswa_event.dart';
import '../bloc/pendidikan/pendidikan_bloc.dart';
import '../bloc/pengalaman/pengalaman_bloc.dart';
import '../bloc/pengalaman/pengalaman_event.dart';
import '../bloc/sertifikat/sertifikat_bloc.dart';
import '../bloc/sertifikat/sertifikat_event.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void initState() {
    super.initState();
    context.read<MahasiswaBloc>().add(LoadMahasiswa());
    context.read<PengalamanBloc>().add(LoadPengalaman());
    context.read<SertifikatBloc>().add(LoadSertifikatEvent());
    context.read<PendidikanBloc>().add(LoadPendidikanEvent());
  }

  final List<Widget> mainPage = [
    const Home(),
    const Leaderboard(),
    const NotificationPage(),
    const Profile(),
  ];

  final List<PreferredSizeWidget> appbar = [
    const AppbarMenuHome(
      color: Color(0xffA80063),
      focus: false,
    ),
    AppBar(
      toolbarHeight: 0,
      backgroundColor: const Color(0xFFA80063),
      // forceMaterialTransparency: true,
      elevation: 0,
    ),
    AppBar(
      toolbarHeight: 0,
    ),
    const AppbarMenuProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncermentBottomNav, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: appbar[state],
          body: mainPage[state],
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -1),
                  )
                ]),
            child: GNav(
              selectedIndex: state,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              iconSize: 20,
              activeColor: const Color(0xffA80063),
              gap: 0,
              onTabChange: (index) {
                context.read<IncermentBottomNav>().incerment(index);
              },
              tabs: [
                GButton(
                  icon: state == 0 ? Icons.home : Icons.home_outlined,
                  // text: "Home",
                ),
                GButton(
                  icon: state == 1
                      ? Icons.leaderboard
                      : Icons.leaderboard_outlined,
                  // text: "Leaderboard",
                ),
                GButton(
                  icon: state == 2
                      ? Icons.notifications
                      : Icons.notifications_none_outlined,
                  // text: "Notification",
                ),
                GButton(
                  icon: state == 3 ? Icons.person : Icons.person_outline,
                  // text: "Profile",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
