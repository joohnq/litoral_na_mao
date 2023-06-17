import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:litoral_na_mao/common/theme/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.onCloseDrawer,
  }) : super(key: key);

  final VoidCallback onCloseDrawer;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: ColorPalette.blue,
            ),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Image.asset(
                'assets/images/logo.png',
                height: 100,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: ColorPalette.orange,
            ),
            title: const Text(
              'Início',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Get.toNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person_outlined,
              color: ColorPalette.orange,
            ),
            title: const Text(
              'Quem somos',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Get.toNamed('/quemsomos');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.privacy_tip_outlined,
              color: ColorPalette.orange,
            ),
            title: const Text(
              'Privacidade',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Get.toNamed('/privacidade');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.close_outlined,
              color: ColorPalette.orange,
            ),
            title: const Text(
              'Fechar',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: onCloseDrawer,
          ),
        ],
      ),
    );
  }
}
