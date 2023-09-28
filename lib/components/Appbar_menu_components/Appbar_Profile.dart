import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppbarMenuProfile extends StatelessWidget implements PreferredSizeWidget {
  const AppbarMenuProfile({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFA80063),
      actions: [
        PopupMenuButton(
          elevation: 0,
          padding: const EdgeInsets.all(24),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          icon: const Icon(Icons.more_horiz),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                  onTap: () {},
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.cancel_presentation_outlined,
                      color: Color(0xFFA80063),
                    ),
                  )),
              PopupMenuItem(
                onTap: () {
                  context.goNamed("setting");
                },
                child: const Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Icon(
                        Icons.settings,
                        color: Color(0xFFA80063),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Pengaturan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1.25,
                        letterSpacing: -0.24,
                      ),
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () {},
                child: const Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Icon(
                        Icons.share,
                        color: Color(0xFFA80063),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Salin Link Profil',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1.25,
                        letterSpacing: -0.24,
                      ),
                    )
                  ],
                ),
              ),
            ];
          },
        )
      ],
      elevation: 0,
    );
  }
}
