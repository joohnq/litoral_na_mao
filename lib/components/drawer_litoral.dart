import 'package:flutter/material.dart';

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
              color: Color.fromARGB(255, 25, 60, 83),
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
              color: Color.fromARGB(255, 235, 99, 48),
            ),
            title: const Text('Início'),
            onTap: onCloseDrawer,
          ),
          ListTile(
            leading: const Icon(
              Icons.person_outlined,
              color: Color.fromARGB(255, 235, 99, 48),
            ),
            title: const Text('Quem somos'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.privacy_tip_outlined,
              color: Color.fromARGB(255, 235, 99, 48),
            ),
            title: const Text('Privacidade'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.close_outlined,
              color: Color.fromARGB(255, 235, 99, 48),
            ),
            title: const Text('Fechar'),
            onTap: onCloseDrawer,
          ),
        ],
      ),
    );
  }
}
