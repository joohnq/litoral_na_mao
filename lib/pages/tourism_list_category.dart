import 'package:flutter/material.dart';
import 'package:litoral_na_mao/utils/format_text.dart';
import 'package:litoral_na_mao/models/city.dart';
import 'package:litoral_na_mao/services/api_service.dart';
import 'package:litoral_na_mao/widgets/custom_loading.dart';
import 'package:litoral_na_mao/widgets/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/header.dart';
import 'package:litoral_na_mao/widgets/tourism_point_category.dart';
import 'package:get/get.dart';

class TourismListCategory extends StatefulWidget {
  final nameCity = Get.parameters['nameCity'];
  TourismListCategory({Key? key}) : super(key: key);

  @override
  State<TourismListCategory> createState() => _TourismListCategoryState();
}

class _TourismListCategoryState extends State<TourismListCategory> {
  late Future<List<String>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = fetchCategories();
  }

  Future<List<String>> fetchCategories() async {
    final cities = await getHttp();
    final filteredCity = cities.firstWhere(
      (city) => removerEspacosLetrasMaiusculas(city.name) == widget.nameCity,
      orElse: () =>
          City(name: '', images: [], tourism: [], commercialGuide: []),
    );
    return filteredCity.tourism.map((tourism) => tourism.category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            const FormSearchBar(),
            Expanded(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: FutureBuilder<List<String>>(
                    future: futureCategories,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CustomLoading();
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text('Erro ao buscar os dados da API'),
                        );
                      } else if (snapshot.hasData) {
                        final categories = snapshot.data!;
                        return ListView.builder(
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return TourismPointCategory(
                              nameCity: widget.nameCity!,
                              nameCategory: categories[index],
                            );
                          },
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
            ),
          ],
        ),
      ),
    );
  }
}
