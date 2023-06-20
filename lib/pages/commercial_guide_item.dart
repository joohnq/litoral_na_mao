import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litoral_na_mao/common/font/font_style.dart';
import 'package:litoral_na_mao/common/theme/colors.dart';
import 'package:litoral_na_mao/models/city.dart';
import 'package:litoral_na_mao/services/api_service.dart';
import 'package:litoral_na_mao/utils/format_text.dart';
import 'package:litoral_na_mao/widgets/carousel.dart';
import 'package:litoral_na_mao/widgets/custom_loading.dart';
import 'package:litoral_na_mao/widgets/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/header.dart';
import 'package:litoral_na_mao/widgets/map.dart';
import 'package:litoral_na_mao/widgets/social_media_section.dart';

class CommercialGuideItemPage extends StatefulWidget {
  final namePoint = Get.parameters['namePoint']!;
  final nameCity = Get.parameters['nameCity']!;
  CommercialGuideItemPage({Key? key}) : super(key: key);

  @override
  State<CommercialGuideItemPage> createState() =>
      _CommercialGuideItemPageState();
}

class _CommercialGuideItemPageState extends State<CommercialGuideItemPage> {
  late Future<CommercialGuide> point;
  @override
  void initState() {
    super.initState();
    point = fetchRequest();
  }

  Future<CommercialGuide> fetchRequest() async {
    List<CommercialGuide> commercialGuideData = [];
    List resultList = await apiRequest(
        'https://api-litoral.vercel.app/api/cities/${widget.nameCity}/commercialGuide/${widget.nameCity}');

    for (var item in resultList) {
      commercialGuideData.add(CommercialGuide.fromJson(item));
    }
    return commercialGuideData.firstWhere((element) =>
        removerEspacosLetrasMaiusculas(element.name) ==
        removerEspacosLetrasMaiusculas(widget.namePoint));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Header(),
            const FormSearchBar(),
            FutureBuilder(
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
                  final formattedPhones =
                      point.tel.map(formatPhoneNumber).toList();
                  return Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Center(
                              child: Text(
                                point.name,
                                style: TextFontStyle.bold.copyWith(
                                  fontSize: 30,
                                  color: ColorPalette.green,
                                ),
                              ),
                            ),
                          ),
                          Carousel(
                              images: point.images, carouselText: const []),
                          _buildInfoSection(
                            title: 'Endereço',
                            icon: Icons.place,
                            text: [point.adress],
                          ),
                          _buildInfoSection(
                            title: 'Telefone(s)',
                            icon: Icons.phone,
                            text: formattedPhones,
                          ),
                          const SocialMediaSection(),
                          _buildInfoSection(
                            title: 'Horário de Funcionamento',
                            icon: Icons.access_time,
                            text: point.workHour,
                          ),
                          _buildInfoSection(
                            title: 'Sobre',
                            icon: Icons.info,
                            text: [point.about],
                          ),
                          _buildInfoSection(
                            title: 'Como Chegar',
                            icon: Icons.directions,
                            child: const MapCustom(),
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

  Widget _buildInfoSection({
    required String title,
    required IconData icon,
    List<String>? text,
    Widget? child,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              title,
              style: TextFontStyle.semiBold.copyWith(
                color: ColorPalette.orange,
              ),
            ),
          ),
          if (text != null)
            Row(
              children: [
                Icon(
                  icon,
                  color: ColorPalette.lightGray,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    for (int i = 0; i < text.length; i++)
                      Text(
                        text[i],
                        style: TextFontStyle.regular.copyWith(
                          color: ColorPalette.lightGray,
                          fontSize: 16,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          if (child != null) child,
        ],
      ),
    );
  }
}
