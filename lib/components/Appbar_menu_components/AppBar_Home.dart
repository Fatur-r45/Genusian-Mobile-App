import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/mahasiswa/mahasiswa_bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/mahasiswa/mahasiswa_event.dart';
import 'package:go_router/go_router.dart';

class AppbarMenuHome extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController? nama;
  final IconButton? backButton;
  final Color color;
  final double? shadow;
  final bool focus;

  const AppbarMenuHome(
      {super.key,
      this.nama,
      this.backButton,
      required this.color,
      this.shadow,
      required this.focus});

  @override
  Size get preferredSize => const Size.fromHeight(85);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: color,
      elevation: shadow,
      flexibleSpace: Container(
        // margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: TextField(
          autofocus: focus,
          controller: nama,
          onTap: () {
            context.goNamed("search");
          },
          onChanged: (value) {
            // print(nama?.text);
            context
                .read<MahasiswaBloc>()
                .add(SearchMahasiswaEvent(nama?.text ?? ""));
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            hintText: "Pencarian",
            prefixIcon: const Icon(Icons.search),
            filled: true,
            suffixIcon: backButton,
            fillColor: Colors.white,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
