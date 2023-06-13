// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:litoral_na_mao/models/city.dart';
import 'package:litoral_na_mao/services/api_service.dart';
import 'package:litoral_na_mao/widgets/Drawer/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/FormSearch/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/Header/header.dart';
import 'package:litoral_na_mao/widgets/GuiaComercial/guia_comercial_point.dart';

class GuiaComercialList extends StatefulWidget {
  const GuiaComercialList({
    Key? key,
    required this.nameCity,
  }) : super(key: key);

  final String? nameCity;

  @override
  State<GuiaComercialList> createState() => _GuiaComercialListState();
}

class _GuiaComercialListState extends State<GuiaComercialList> {
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
    return Scaffold(
      body: ListView(
        children: [
          const Header(),
          const FormSearchBar(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: FutureBuilder<List<City>>(
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
                    // final cities = snapshot.data!;
                    return Wrap(
                      spacing: 10,
                      children: List.generate(
                        10,
                        (_) => GuiaComercialPoint(
                          nameCity: widget.nameCity ?? '',
                          namePoint: '',
                          descPoint: '',
                          locationPoint: '',
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
      endDrawer: CustomDrawer(
        onCloseDrawer: () {
          Scaffold.of(context).openEndDrawer();
        },
      ),
    );
  }
}
