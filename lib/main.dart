import 'package:flutter/material.dart';
import 'package:litoral_na_mao/components/Header.dart';
import 'package:litoral_na_mao/components/Carousel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        body: Column(
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (MediaQuery.of(context).size.width > 600) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10.0),
                  );
                } else {
                  return Container(
                    margin: const EdgeInsets.only(top: kToolbarHeight - 20.0),
                  );
                }
              },
            ),
            const Header(),
            const Carousel(),
          ],
        ),
        endDrawer: Drawer(
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
                  )),
              ListTile(
                leading: const Icon(
                  Icons.home_outlined,
                  color: Color.fromARGB(255, 235, 99, 48),
                ),
                title: const Text('Início'),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
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
                onTap: () {
                  scaffoldKey.currentState!.closeEndDrawer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
