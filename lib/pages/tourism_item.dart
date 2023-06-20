import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litoral_na_mao/common/font/font_style.dart';
import 'package:litoral_na_mao/common/theme/colors.dart';
import 'package:litoral_na_mao/models/city.dart';
import 'package:litoral_na_mao/services/api_service.dart';
import 'package:litoral_na_mao/utils/format_text.dart';
import 'package:litoral_na_mao/widgets/custom_loading.dart';
import 'package:litoral_na_mao/widgets/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/header.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TourismItemPage extends StatefulWidget {
  final nameCity = Get.parameters['nameCity']!;
  final namePoint = Get.parameters['namePoint']!;
  TourismItemPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TourismItemPage> createState() => _TourismItemPageState();
}

class _TourismItemPageState extends State<TourismItemPage> {
  late Future<List<City>> futureCities;
  late Future<Point> point;

  @override
  void initState() {
    super.initState();
    point = fetchRequest();
  }

  Future<Point> fetchRequest() async {
    List<Point> tourismPoint = [];
    List resultList = await apiRequest(
        'https://api-litoral.vercel.app/api/cities/${widget.nameCity}/tourism/points');

    for (var i in resultList) {
      tourismPoint.add(Point.fromJson(i));
    }
    final point = tourismPoint.firstWhere((element) =>
        removerEspacosLetrasMaiusculas(element.name) ==
        removerEspacosLetrasMaiusculas(widget.namePoint));
    return point;
  }

  Future<List<City>> fetchApi() async {
    return await getAllCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Header(),
            const FormSearchBar(),
            FutureBuilder<Point>(
              future: point,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomLoading();
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Erro ao buscar os dados da API'),
                  );
                } else if (snapshot.hasData) {
                  final point = snapshot.data!;
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: ResponsiveBuilder(
                              builder: (context, sizingInformation) {
                                final bool isSmallScreen =
                                    sizingInformation.screenSize.width < 576;
                                final TextStyle textStyle =
                                    TextFontStyle.bold.copyWith(
                                  color: ColorPalette.green,
                                  fontSize: isSmallScreen ? 28 : 40,
                                );
                                return Text(
                                  'Turismo',
                                  style: textStyle,
                                );
                              },
                            ),
                          ),
                          ResponsiveBuilder(
                            builder: (context, sizingInformation) {
                              final bool isSmallScreen =
                                  sizingInformation.screenSize.width < 576;
                              final TextStyle textStyle =
                                  TextFontStyle.bold.copyWith(
                                fontSize: isSmallScreen ? 24 : 30,
                              );
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: Text(
                                  point.name,
                                  style: textStyle,
                                ),
                              );
                            },
                          ),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 800),
                            child: Image.asset(
                              point.image,
                              height: 400,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                            child: Text(
                              point.description,
                              style: TextFontStyle.medium.copyWith(
                                fontSize: 18,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
      endDrawer: CustomDrawer(
        onCloseDrawer: () {
          Scaffold.of(context).openEndDrawer();
        },
      ),
    );
  }
}
