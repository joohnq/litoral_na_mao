

import 'package:flutter/material.dart';
import 'package:litoral_na_mao/models/city.dart';
import 'package:litoral_na_mao/services/api_service.dart';
import 'package:litoral_na_mao/widgets/Buttons/buttons_qap.dart';
import 'package:litoral_na_mao/widgets/Carousel/carousel.dart';
import 'package:litoral_na_mao/widgets/Citie/cities.dart';
import 'package:litoral_na_mao/widgets/Drawer/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/Header/header.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<City>> futureCities;

  @override
  void initState() {
    super.initState();
    futureCities = fetchApi();
  }

  Future<List<City>> fetchApi() async {
    return await getHttp();
  }

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
          FutureBuilder<List<City>>(
            future: futureCities,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Erro ao buscar os dados da API'),
                );
              } else if (snapshot.hasData) {
                final cities = snapshot.data!;
                final carouselImages =
                    cities.expand((city) => city.images).toList();
                List<Map<String, String>> citiesData = [];
                for (var i = 0; i < cities.length && i < 4; i++) {
                  String name = cities[i].name;
                  String firstImage = cities[i].images[0];

                  Map<String, String> data = {
                    'name': name,
                    'image': firstImage,
                  };

                  citiesData.add(data);
                }
                return Column(
                  children: [
                    Carousel(
                      images: carouselImages,
                      carouselText: const [
                        'O guia',
                        'definitivo',
                        'da sua Cidade'
                      ],
                    ),
                    Cities(
                      cities: citiesData,
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text('Nenhum dado disponível'),
                );
              }
            },
          ),
          const ButtonsQap(),
        ],
      ),
      endDrawer: CustomDrawer(onCloseDrawer: closeDrawer),
    );
  }
}
