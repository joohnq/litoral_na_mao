import 'package:flutter/material.dart';
import 'package:litoral_na_mao/common/font/font_style.dart';
import 'package:litoral_na_mao/common/theme/colors.dart';
import 'package:litoral_na_mao/models/city.dart';
import 'package:litoral_na_mao/services/api_service.dart';
// import 'package:litoral_na_mao/utils/format_text.dart';
import 'package:litoral_na_mao/widgets/buttons_qap.dart';
import 'package:litoral_na_mao/widgets/buttons_teg.dart';
import 'package:litoral_na_mao/widgets/carousel.dart';
import 'package:litoral_na_mao/widgets/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/header.dart';
import 'package:litoral_na_mao/widgets/form_search_bar.dart';
import 'package:get/get.dart';
import 'package:litoral_na_mao/widgets/custom_loading.dart';

class CityDetail extends StatefulWidget {
  final nameCity = Get.parameters["value"];
  CityDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<CityDetail> createState() => _CityDetailState();
}

class _CityDetailState extends State<CityDetail> {
  late Future<City> city;

  @override
  void initState() {
    super.initState();
    city = fetchRequest();
  }

  Future<City> fetchRequest() async {
    var result = City.fromJson(await apiRequest(
        'https://api-litoral.vercel.app/api/cities/${widget.nameCity}'));
    return result;
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
              future: city,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomLoading();
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Erro ao buscar os dados da API'),
                  );
                } else if (snapshot.hasData) {
                  City? cityData = snapshot.data;
                  return Column(
                    children: [
                      Carousel(
                        images: cityData!.images,
                        carouselText: [
                          'Seu guia',
                          'definitivo de',
                          (cityData.name)
                        ],
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
                                  cityData.name,
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
