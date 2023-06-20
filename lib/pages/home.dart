import 'package:flutter/material.dart';
import 'package:litoral_na_mao/models/city.dart';
import 'package:litoral_na_mao/services/api_service.dart';
import 'package:litoral_na_mao/widgets/buttons_qap.dart';
import 'package:litoral_na_mao/widgets/carousel.dart';
import 'package:litoral_na_mao/widgets/cities.dart';
import 'package:litoral_na_mao/widgets/custom_loading.dart';
import 'package:litoral_na_mao/widgets/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/header.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<City>> cities;

  @override
  void initState() {
    super.initState();
    cities = fetchApi();
  }

  Future<List<City>> fetchApi() async {
    return await getAllCities();
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
            const Header(isHome: true),
            FutureBuilder<List<City>>(
              future: cities,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomLoading();
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Erro ao buscar os dados da API'),
                  );
                } else if (snapshot.hasData) {
                  final citiesData = snapshot.data!;
                  return Column(
                    children: [
                      Carousel(
                        images:
                            citiesData.expand((city) => city.images).toList(),
                        carouselText: const [
                          'O guia',
                          'definitivo',
                          'da sua Cidade'
                        ],
                      ),
                      Cities(
                        cities: citiesData
                            .take(4)
                            .map((e) => {"name": e.name, "image": e.images[0]})
                            .toList(),
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
      ),
      endDrawer: CustomDrawer(onCloseDrawer: closeDrawer),
    );
  }
}
