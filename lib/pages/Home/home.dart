import 'package:flutter/material.dart';
import 'package:litoral_na_mao/app/data/http/http_client.dart';
import 'package:litoral_na_mao/app/data/repositiories/city_repository.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:litoral_na_mao/pages/stores/city_store.dart';
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
  final CityStore store = CityStore(
    repository: CityRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    store.getCities();
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
          const Carousel(images: [
            'caraguatatuba.jpg',
            'ilhabela.jpg',
            'saosebastiao.jpg',
            'ubatuba.jpg'
          ], carouselText: [
            'O guia',
            'definitivo',
            'da sua Cidade'
          ]),
          AnimatedBuilder(
            animation:
                Listenable.merge([store.isLoading, store.error, store.state]),
            builder: (context, child) {
              if (store.isLoading.value) {
                return const CircularProgressIndicator();
              }

              if (store.error.value.isNotEmpty) {
                return Center(
                  child: Text(
                    store.error.value,
                    style: const TextStyle(
                        color: ColorPalette.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                );
              }

              if (store.state.value.isEmpty) {
                return const Center(
                  child: Text(
                    'Nenhum item na lista',
                    style: TextStyle(
                        color: ColorPalette.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 32,
                  ),
                  itemCount: store.state.value.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (_, index) {
                    final item = store.state.value[index];

                    return Column(children: [Text(item.name)]);
                  },
                );
              }
            },
          ),
          const Cities(),
          const ButtonsQap()
        ],
      ),
      endDrawer: CustomDrawer(onCloseDrawer: closeDrawer),
    );
  }
}
