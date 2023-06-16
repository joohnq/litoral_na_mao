import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:litoral_na_mao/format_text.dart';
// import 'package:litoral_na_mao/future_builder.dart';
import 'package:litoral_na_mao/models/city.dart';
import 'package:litoral_na_mao/services/api_service.dart';
import 'package:litoral_na_mao/widgets/Buttons/buttons_qap.dart';
import 'package:litoral_na_mao/widgets/Buttons/buttons_teg.dart';
import 'package:litoral_na_mao/widgets/Carousel/carousel.dart';
import 'package:litoral_na_mao/widgets/Drawer/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/Header/header.dart';
import 'package:litoral_na_mao/widgets/FormSearch/form_search_bar.dart';

class CityDetail extends StatefulWidget {
  final String? nameCity;
  const CityDetail({
    Key? key,
    required this.nameCity,
  }) : super(key: key);

  @override
  State<CityDetail> createState() => _CityDetailState();
}

class _CityDetailState extends State<CityDetail> {
  late Future<List<City>> futureCities;
  late String cityName;
  late List<String> carouselImages;
  late List<Map<String, String>> citiesData;

  @override
  void initState() {
    super.initState();
    futureCities = fetchApi();
  }

  Future<List<City>> fetchApi() async {
    List<City> cities = await getHttp();

    cityName = cities
        .where((city) {
          return removerEspacosLetrasMaiusculas(city.name) == widget.nameCity;
        })
        .map((city) => city.name)
        .toList()[0];

    carouselImages = cities
        .where((city) {
          return removerEspacosLetrasMaiusculas(city.name) == widget.nameCity;
        })
        .expand((city) => city.images)
        .toList();

    citiesData = [];
    for (var i = 0; i < cities.length && i < 4; i++) {
      String name = cities[i].name;
      String firstImage = cities[i].images[0];

      Map<String, String> data = {
        'name': name,
        'image': firstImage,
      };

      citiesData.add(data);
    }

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
          const FormSearchBar(),
          FutureBuilder(
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
                final cityName = this.cityName;
                final carouselImages = this.carouselImages;

                return Column(
                  children: [
                    Carousel(
                      images: carouselImages,
                      carouselText: ['Seu guia', 'definitivo de', cityName],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text(
                          cityName,
                          style: const TextStyle(
                            color: ColorPalette.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ),
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
          ButtonsTeg(
            name: widget.nameCity ?? '',
          ),
          const ButtonsQap(),
        ],
      ),
      endDrawer: CustomDrawer(onCloseDrawer: closeDrawer),
    );
  }
}
