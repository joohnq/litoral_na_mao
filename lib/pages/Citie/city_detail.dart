import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:litoral_na_mao/widgets/Buttons/buttons_qap.dart';
import 'package:litoral_na_mao/widgets/Buttons/buttons_teg.dart';
import 'package:litoral_na_mao/widgets/Carousel/carousel.dart';
import 'package:litoral_na_mao/widgets/Drawer/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/Header/header.dart';
import 'package:litoral_na_mao/widgets/FormSearch/form_search_bar.dart';

class CityDetail extends StatelessWidget {
  const CityDetail({
    Key? key,
    required this.nameCity,
  }) : super(key: key);

  final String? nameCity;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    void closeDrawer() {
      scaffoldKey.currentState!.closeEndDrawer();
    }

    return Scaffold(
      key: scaffoldKey,
      body: ListView(
        children: [
          const Header(),
          const FormSearchBar(),
          Carousel(
              images: ['$nameCity.jpg'],
              carouselText: ['Seu guia', 'definitivo de', nameCity!]),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                nameCity![0].toUpperCase() + nameCity!.substring(1),
                style: const TextStyle(
                    color: ColorPalette.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
          ),
          ButtonsTeg(
            name: nameCity ?? '',
          ),
          const ButtonsQap(),
        ],
      ),
      endDrawer: CustomDrawer(onCloseDrawer: closeDrawer),
    );
  }
}
