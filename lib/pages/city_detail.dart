import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:litoral_na_mao/common/font/font_style.dart';
import 'package:litoral_na_mao/common/theme/colors.dart';
import 'package:litoral_na_mao/utils/format_text.dart';
// import 'package:litoral_na_mao/future_builder.dart';
import 'package:litoral_na_mao/models/city.dart';
import 'package:litoral_na_mao/services/api_service.dart';
import 'package:litoral_na_mao/widgets/buttons_qap.dart';
import 'package:litoral_na_mao/widgets/buttons_teg.dart';
import 'package:litoral_na_mao/widgets/carousel.dart';
import 'package:litoral_na_mao/widgets/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/header.dart';
import 'package:litoral_na_mao/widgets/form_search_bar.dart';
import 'package:get/get.dart';
import 'package:litoral_na_mao/widgets/custom_loading.dart';

class CityDetail extends StatefulWidget {
  final nameCity = Get.arguments["nameCity"];
  CityDetail({
    Key? key,
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
      body: SafeArea(
        child: ListView(
          children: [
            const Header(),
            const FormSearchBar(),
            FutureBuilder(
              future: futureCities,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomLoading();
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
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text(
                                  cityName,
                                  style: TextFontStyle.bold.copyWith(
                                    fontSize: 40,
                                    color: ColorPalette.green,
                                  ),
                                ),
                              ),
                            ),
                            ButtonsTeg(
                              name: widget.nameCity ?? '',
                            ),
                            const ButtonsQap(),
                          ],
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
          ],
        ),
      ),
      endDrawer: CustomDrawer(onCloseDrawer: closeDrawer),
    );
  }
}
