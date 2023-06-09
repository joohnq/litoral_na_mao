import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litoral_na_mao/models/city.dart';
import 'package:litoral_na_mao/services/api_service.dart';
import 'package:litoral_na_mao/utils/format_text.dart';
import 'package:litoral_na_mao/widgets/custom_loading.dart';
import 'package:litoral_na_mao/widgets/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/header.dart';
import 'package:litoral_na_mao/widgets/tourism_point.dart';

class TourismList extends StatefulWidget {
  final nameCity = Get.parameters['nameCity']!;
  final nameCategory = Get.parameters['nameCategory'];

  TourismList({
    Key? key,
  }) : super(key: key);

  @override
  State<TourismList> createState() => _TourismListState();
}

class _TourismListState extends State<TourismList> {
  late Future<List<Point>> tourismPoints;

  @override
  void initState() {
    super.initState();
    tourismPoints = fetchRequest();
  }

  Future<List<Point>> fetchRequest() async {
    List<Point> tourismPoint = [];
    List resultList = await apiRequest(
        'https://api-litoral.vercel.app/api/cities/${removerEspacosLetrasMaiusculas(widget.nameCity)}/tourism/points');

    for (var i in resultList) {
      tourismPoint.add(Point.fromJson(i));
    }
    return tourismPoint;
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
                  child: FutureBuilder(
                    future: tourismPoints,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CustomLoading();
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text('Erro ao buscar os dados da API'),
                        );
                      } else if (snapshot.hasData) {
                        final tourismPoints = snapshot.data!;
                        return ListView.builder(
                          itemCount: tourismPoints.length,
                          itemBuilder: (context, index) {
                            return TourismPoint(
                              nameCity: widget.nameCity,
                              namePoint: tourismPoints[index].name,
                              descPoint: tourismPoints[index].description,
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
