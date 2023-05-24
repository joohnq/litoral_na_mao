import 'package:flutter/material.dart';
import 'package:litoral_na_mao/pages/anuncie.dart';
import 'package:litoral_na_mao/pages/citie_detail.dart';
import 'package:litoral_na_mao/pages/guia_comercial_item.dart';
import 'package:litoral_na_mao/pages/home.dart';
import 'package:litoral_na_mao/pages/privacidade.dart';
import 'package:litoral_na_mao/pages/quem_somos.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Litoral na Mão',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/city_detail': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>?;
          return CitieDetail(
            nameCity: arguments?['nameCity'] as String?,
            image: arguments?['image'] as String?,
          );
        },
        '/privacidade': (context) => const Privacidade(),
        '/anuncie': (context) => const Anuncie(),
        '/quemsomos': (context) => const QuemSomos(),
      },
    );
  }
}
