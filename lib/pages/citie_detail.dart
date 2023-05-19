import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:litoral_na_mao/components/buttons_qap.dart';
import 'package:litoral_na_mao/components/buttons_teg.dart';
import 'package:litoral_na_mao/components/carousel.dart';
import 'package:litoral_na_mao/components/drawer_litoral.dart';
import 'package:litoral_na_mao/components/header.dart';
import 'package:litoral_na_mao/components/form_search_bar.dart';

class CitieDetail extends StatelessWidget {
  const CitieDetail({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  final String name;
  final String image;

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
            Carousel(images: [image]),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(
                      color: ColorPalette.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
            ),
            ButtonsTeg(
              name: name,
            ),
            const ButtonsQap(),
          ],
        ),
        endDrawer: CustomDrawer(onCloseDrawer: closeDrawer));
  }
}
