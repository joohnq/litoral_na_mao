import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';
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
          const FormSearchBar(),
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
                final carouselImages = cities
                    .where((city) => city.name == widget.nameCity)
                    .expand((city) => city.images)
                    .toList();
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
                return Carousel(images: carouselImages, carouselText: [
                  'Seu guia',
                  'definitivo de',
                  widget.nameCity!
                ]);
              } else {
                // If there is no data, display a message or an alternate widget
                return const Center(
                  child: Text('Nenhum dado disponível'),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                widget.nameCity![0].toUpperCase() +
                    widget.nameCity!.substring(1),
                style: const TextStyle(
                    color: ColorPalette.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
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
