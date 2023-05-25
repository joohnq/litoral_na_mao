import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:litoral_na_mao/widgets/buttons_qap.dart';
import 'package:litoral_na_mao/widgets/buttons_teg.dart';
import 'package:litoral_na_mao/widgets/carousel.dart';
import 'package:litoral_na_mao/widgets/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/header.dart';
import 'package:litoral_na_mao/widgets/form_search_bar.dart';

class CityDetail extends StatelessWidget {
  const CityDetail({
    Key? key,
    required this.nameCity,
    // required this.image,
  }) : super(key: key);

  final String? nameCity;
  // final String? image;

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
                carouselText: ['Seu guia', 'definitivo de', nameCity ?? '']),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  nameCity ?? '',
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
        endDrawer: CustomDrawer(onCloseDrawer: closeDrawer));
  }
}
