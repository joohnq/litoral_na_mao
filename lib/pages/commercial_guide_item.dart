import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:litoral_na_mao/widgets/Carousel/carousel.dart';
import 'package:litoral_na_mao/widgets/Drawer/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/FormSearch/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/Header/header.dart';
import 'package:litoral_na_mao/widgets/Map/map.dart';
import 'package:litoral_na_mao/widgets/SocialMediaIcon/social_media_section.dart';

class CommercialGuideItemPage extends StatelessWidget {
  const CommercialGuideItemPage({Key? key, required this.namePoint})
      : super(key: key);

  final String? namePoint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    text: 'R Luiz Passos Júnior, 69, 69\nCep:11660-270',
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
