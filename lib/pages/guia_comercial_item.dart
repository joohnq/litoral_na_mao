import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:litoral_na_mao/widgets/carousel.dart';
import 'package:litoral_na_mao/widgets/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/header.dart';
import 'package:litoral_na_mao/widgets/map.dart';
import 'package:unicons/unicons.dart';
import 'package:ionicons/ionicons.dart';

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
                      images: ['caraguatatuba.jpg', 'ilhabela.jpg'],  carouselText: []
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
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
                                      color: ColorPalette.lightGray,
                                      fontSize: 18),
                                )
                              ]),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
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
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            color: const Color.fromRGBO(59, 89, 151, 1),
                            child: const Icon(UniconsLine.facebook_f,
                                color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 50,
                            height: 50,
                            color: const Color.fromRGBO(65, 183, 216, 1),
                            child: const Icon(UniconsLine.twitter,
                                color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 50,
                            height: 50,
                            color: const Color.fromRGBO(178, 178, 178, 1),
                            child: const Icon(UniconsLine.youtube,
                                color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 50,
                            height: 50,
                            color: const Color.fromRGBO(203, 32, 39, 1),
                            child: const Icon(Ionicons.logo_pinterest,
                                color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 50,
                            height: 50,
                            color: const Color.fromRGBO(61, 115, 156, 1),
                            child: const Icon(UniconsLine.instagram,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Horário de Funcionamento',
                            style: TextStyle(
                                color: ColorPalette.orange, fontSize: 22),
                          ),
                          Text('Horários...',
                              style: TextStyle(
                                  color: ColorPalette.lightGray, fontSize: 18)),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sobre',
                            style: TextStyle(
                                color: ColorPalette.orange, fontSize: 22),
                          ),
                          Text('Sobre...',
                              style: TextStyle(
                                  color: ColorPalette.lightGray, fontSize: 18)),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Como Chegar',
                            style: TextStyle(
                                color: ColorPalette.orange, fontSize: 22),
                          ),
                          MapCustom(),
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
