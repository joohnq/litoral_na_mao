import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:litoral_na_mao/components/carousel.dart';
import 'package:litoral_na_mao/components/drawer_litoral.dart';
import 'package:litoral_na_mao/components/form_search_bar.dart';
import 'package:litoral_na_mao/components/header.dart';

class GuiaComercialItemPage extends StatelessWidget {
  const GuiaComercialItemPage({Key? key, required this.namePoint})
      : super(key: key);

  final String namePoint;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    void closeDrawer() {
      scaffoldKey.currentState!.closeEndDrawer();
    }

    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        body: ListView(
          children: [
            const Header(),
            const FormSearchBar(),
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child: Center(
                        child: Text(
                          namePoint,
                          style: const TextStyle(
                              color: ColorPalette.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                    ),
                    const Carousel(
                      images: ['caraguatatuba.jpg', 'ilhabela.jpg'],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Endereço',
                              style: TextStyle(
                                  color: ColorPalette.orange, fontSize: 22),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.place,
                                  color: ColorPalette.lightGray,
                                  size: 15,
                                ),
                                SizedBox(width: 10),
                                Text('R Luiz Passos Júnior, 69, 69',
                                    style: TextStyle(
                                        color: ColorPalette.lightGray,
                                        fontSize: 18)),
                              ],
                            ),
                            Text(
                              'Cep:11660-270',
                              style: TextStyle(
                                  color: ColorPalette.lightGray, fontSize: 18),
                            )
                          ]),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Telefone(s)',
                            style: TextStyle(
                                color: ColorPalette.orange, fontSize: 22),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: ColorPalette.lightGray,
                                size: 15,
                              ),
                              SizedBox(width: 10),
                              Text('(12) 3882-1585',
                                  style: TextStyle(
                                      color: ColorPalette.lightGray,
                                      fontSize: 18)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: ColorPalette.lightGray,
                                size: 15,
                              ),
                              SizedBox(width: 10),
                              Text('(12) 3882-1585',
                                  style: TextStyle(
                                      color: ColorPalette.lightGray,
                                      fontSize: 18)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        endDrawer: CustomDrawer(onCloseDrawer: closeDrawer),
      ),
    );
  }
}
