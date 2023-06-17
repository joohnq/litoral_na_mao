import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litoral_na_mao/common/theme/colors.dart';
import 'package:litoral_na_mao/widgets/carousel.dart';
import 'package:litoral_na_mao/widgets/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/header.dart';
import 'package:litoral_na_mao/widgets/map.dart';
import 'package:litoral_na_mao/widgets/social_media_section.dart';

class CommercialGuideItemPage extends StatelessWidget {
  final namePoint = Get.arguments['namePoint'];
  final desc = Get.arguments['desc'];
  final location = Get.arguments['location'];

  CommercialGuideItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            )
          : null,
      body: ListView(
        children: [
          const Header(),
          const FormSearchBar(),
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Center(
                      child: Text(
                        namePoint!,
                        style: const TextStyle(
                          color: ColorPalette.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                  const Carousel(images: [], carouselText: []),
                  _buildInfoSection(
                    title: 'Endereço',
                    icon: Icons.place,
                    text: location,
                  ),
                  _buildInfoSection(
                    title: 'Telefone(s)',
                    icon: Icons.phone,
                    text: '(12) 3882-1585\n(12) 3882-1585',
                  ),
                  const SocialMediaSection(),
                  _buildInfoSection(
                    title: 'Horário de Funcionamento',
                    icon: Icons.access_time,
                    text: 'Horários...',
                  ),
                  _buildInfoSection(
                    title: 'Sobre',
                    icon: Icons.info,
                    text: 'Sobre...',
                  ),
                  _buildInfoSection(
                    title: 'Como Chegar',
                    icon: Icons.directions,
                    child: const MapCustom(),
                  ),
                ],
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

  Widget _buildInfoSection({
    required String title,
    required IconData icon,
    String? text,
    Widget? child,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              title,
              style: const TextStyle(
                color: ColorPalette.orange,
                fontSize: 22,
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
                Text(
                  text,
                  style: const TextStyle(
                    color: ColorPalette.lightGray,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          if (child != null) child,
        ],
      ),
    );
  }
}
