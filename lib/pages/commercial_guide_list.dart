// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litoral_na_mao/utils/format_text.dart';
import 'package:litoral_na_mao/models/city.dart';
import 'package:litoral_na_mao/services/api_service.dart';
import 'package:litoral_na_mao/widgets/custom_loading.dart';
import 'package:litoral_na_mao/widgets/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/header.dart';
import 'package:litoral_na_mao/widgets/commercial_guide_point.dart';

class CommercialGuideList extends StatefulWidget {
  final nameCity = Get.parameters['nameCity'];

  CommercialGuideList({
    Key? key,
  }) : super(key: key);

  @override
  State<CommercialGuideList> createState() => _GuiaComercialListState();
}

class _GuiaComercialListState extends State<CommercialGuideList> {
  late Future<List<CommercialGuide>> futurePoint;

  @override
  void initState() {
    super.initState();
    futurePoint = fetchPoints();
  }

  Future<List<CommercialGuide>> fetchPoints() async {
    final cities = await getHttp();
    final filteredCity = cities.firstWhere(
      (city) => removerEspacosLetrasMaiusculas(city.name) == widget.nameCity,
      orElse: () =>
          City(name: '', tourism: [], images: [], commercialGuide: []),
    );
    return filteredCity.commercialGuide
        .map((guiaComercial) => guiaComercial)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Header(),
            const FormSearchBar(),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: FutureBuilder<List<CommercialGuide>>(
                  future: futurePoint,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CustomLoading();
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Erro ao buscar os dados da API'),
                      );
                    } else if (snapshot.hasData) {
                      final points = snapshot.data!;
                      return Wrap(
                        spacing: 10,
                        children: List.generate(
                          points.length,
                          (index) => CommercialGuidePoint(
                            nameCity: widget.nameCity ?? '',
                            namePoint: points[index].name,
                            descPoint: points[index].description,
                            locationPoint: "points[index].location",
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
              ),
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
