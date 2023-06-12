// ignore_for_file: avoid_print

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
    final cities = await getHttp();
    return cities;
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
                // Display a loading indicator while the data is being fetched
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                // Display an error widget if there is an error in fetching the data
                return const Center(
                  child: Text('Erro ao buscar os dados da API'),
                );
              } else if (snapshot.hasData) {
                // Display the user interface with the data obtained from the API
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
                // If there is no data, display a message or an alternate widget
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
