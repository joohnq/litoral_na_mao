
import 'package:flutter/material.dart';
import 'package:litoral_na_mao/models/city.dart';
import 'package:litoral_na_mao/services/api_service.dart';
import 'package:litoral_na_mao/widgets/FormSearch/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/Header/header.dart';
import 'package:litoral_na_mao/widgets/Turism/turism_point.dart';
// import 'package:litoral_na_mao/widgets/Turism/turism_point.dart';

class TourismList extends StatefulWidget {
  const TourismList({Key? key, required this.nameCity, this.nameCategory})
      : super(key: key);

  final String? nameCity;
  final String? nameCategory;

  @override
  State<TourismList> createState() => _TourismListState();
}

class _TourismListState extends State<TourismList> {
  late Future futurePoints;

  @override
  void initState() {
    super.initState();
    futurePoints = fetchTourismPoints();
  }

  Future fetchTourismPoints() async {
    final cities = await getHttp();
    final filteredCity = cities.firstWhere(
      (city) => city.name == widget.nameCity,
      orElse: () => City(name: '', turism: [], images: []),
    );
    final filteredTourism =
        filteredCity.turism.expand((tourism) => tourism.points).toList();

    final filteredTourismPoints = filteredTourism
        .map((point) => {
              "name": point.name,
              "description": point.description,
            })
        .toList();
    return filteredTourismPoints;
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
                child: FutureBuilder(
                  future: futurePoints,
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
                      final pointsData = snapshot.data!;
                      return ListView.builder(
                        itemCount: pointsData.length,
                        itemBuilder: (context, index) {
                          return TurismPoint(
                            nameCity: widget.nameCity!,
                            namePoint: pointsData[index]['name'],
                            descPoint: pointsData[index]['description'],
                            category: widget.nameCategory!,
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
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.stretch,
                //   children: [
                //     TurismPoint(
                //       nameCity: widget.nameCity!,
                //       namePoint: 'brava',
                //       descPoint: 'Description',
                //       category: widget.nameCategory!,
                //     ),
                //     TurismPoint(
                //       nameCity: widget.nameCity!,
                //       namePoint: 'chara',
                //       descPoint: 'Description',
                //       category: widget.nameCategory!,
                //     )
                //   ],
                // ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
