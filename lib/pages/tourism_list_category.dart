import 'package:flutter/material.dart';
import 'package:litoral_na_mao/models/city.dart';
import 'package:litoral_na_mao/services/api_service.dart';
import 'package:litoral_na_mao/widgets/FormSearch/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/Header/header.dart';
import 'package:litoral_na_mao/widgets/Turism/tourism_point_category.dart';

class TourismListCategory extends StatefulWidget {
  const TourismListCategory({Key? key, required this.nameCity})
      : super(key: key);

  final String? nameCity;

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
      (city) => city.name == widget.nameCity,
      orElse: () => City(name: '', turism: [], images: []),
    );
    return filteredCity.turism.map((tourism) => tourism.category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
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
    );
  }
}
