import 'package:flutter/material.dart';
import 'package:litoral_na_mao/widgets/buttons_qap.dart';
import 'package:litoral_na_mao/widgets/carousel.dart';
import 'package:litoral_na_mao/widgets/cities.dart';
import 'package:litoral_na_mao/widgets/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/header.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    void closeDrawer() {
      scaffoldKey.currentState!.closeEndDrawer();
    }

    return Scaffold(
      key: scaffoldKey,
      body: ListView(
        children: const [
          Header(),
          Carousel(images: [
            'caraguatatuba.jpg',
            'ilhabela.jpg',
            'saosebastiao.jpg',
            'ubatuba.jpg'
          ], carouselText: [
            'O guia',
            'definitivo',
            'da sua Cidade'
          ]),
          Cities(),
          ButtonsQap()
        ],
      ),
      endDrawer: CustomDrawer(onCloseDrawer: closeDrawer),
    );
  }
}
