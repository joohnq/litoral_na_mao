import 'package:flutter/material.dart';
import 'package:litoral_na_mao/common/font/font_style.dart';
import 'package:litoral_na_mao/common/theme/colors.dart';
import 'package:litoral_na_mao/widgets/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/header.dart';

class Anuncie extends StatelessWidget {
  const Anuncie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    void closeDrawer() {
      scaffoldKey.currentState!.closeEndDrawer();
    }

    return Scaffold(
      key: scaffoldKey,
      body: ListView(
        children: [
          const Header(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      'Anuncie',
                      style: TextFontStyle.bold
                          .copyWith(color: ColorPalette.blue, fontSize: 28),
                    ),
                  ),
                  Text(
                    'O Litoral na Mão é a maneira mais simples de encontrar o que você procura na cidade.',
                    style: TextFontStyle.regular.copyWith(fontSize: 18),
                  ),
                  Text(
                    'Entre em contato conosco agora mesmo e anuncie sua empresa, produto ou serviço para que seja visto por milhares de usuários do nosso site e aplicativo!',
                    style: TextFontStyle.regular.copyWith(fontSize: 18),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      endDrawer: CustomDrawer(onCloseDrawer: closeDrawer),
    );
  }
}
