import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  late Future<List<CommercialGuide>> commercialGuide;

  @override
  void initState() {
    super.initState();
    commercialGuide = fetchRequest();
  }

  Future<List<CommercialGuide>> fetchRequest() async {
    List<CommercialGuide> commercialGuideData = [];
    List resultList = await apiRequest(
        'https://api-litoral.vercel.app/api/cities/${widget.nameCity}/commercialGuide/${widget.nameCity}');

    for (var item in resultList) {
      commercialGuideData.add(CommercialGuide.fromJson(item));
    }
    return commercialGuideData;
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
                  future: commercialGuide,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CustomLoading();
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Erro ao buscar os dados da API'),
                      );
                    } else if (snapshot.hasData) {
                      final commercialGuidePoints = snapshot.data!;
                      return Wrap(
                        spacing: 10,
                        children: List.generate(
                          commercialGuidePoints.length,
                          (index) => CommercialGuidePoint(
                            nameCity: widget.nameCity ?? '',
                            namePoint: commercialGuidePoints[index].name,
                            descPoint: commercialGuidePoints[index].description,
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
