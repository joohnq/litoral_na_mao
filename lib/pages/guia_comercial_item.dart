import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:litoral_na_mao/widgets/carousel.dart';
import 'package:litoral_na_mao/widgets/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/header.dart';
import 'package:litoral_na_mao/widgets/map.dart';
import 'package:unicons/unicons.dart';
import 'package:ionicons/ionicons.dart';

class GuiaComercialItemPage extends StatelessWidget {
  const GuiaComercialItemPage({Key? key, required this.namePoint})
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
                        namePoint ?? '',
                        style: const TextStyle(
                          color: ColorPalette.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                  const Carousel(
                      images: ['caraguatatuba.jpg', 'ilhabela.jpg'],
                      carouselText: []),
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
                  _buildSocialMediaSection(),
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
      endDrawer: CustomDrawer(onCloseDrawer: () {
        Scaffold.of(context).openEndDrawer();
      }),
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

  Widget _buildSocialMediaSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          _buildSocialMediaIcon(
              UniconsLine.facebook_f, const Color.fromRGBO(59, 89, 151, 1)),
          const SizedBox(
            width: 10,
          ),
          _buildSocialMediaIcon(
              UniconsLine.twitter, const Color.fromRGBO(65, 183, 216, 1)),
          const SizedBox(
            width: 10,
          ),
          _buildSocialMediaIcon(
              UniconsLine.youtube, const Color.fromRGBO(178, 178, 178, 1)),
          const SizedBox(
            width: 10,
          ),
          _buildSocialMediaIcon(
              Ionicons.logo_pinterest, const Color.fromRGBO(203, 32, 39, 1)),
          const SizedBox(
            width: 10,
          ),
          _buildSocialMediaIcon(
              UniconsLine.instagram, const Color.fromRGBO(61, 115, 156, 1)),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaIcon(IconData icon, Color color) {
    return Container(
      width: 50,
      height: 50,
      color: color,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
