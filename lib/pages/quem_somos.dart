import 'package:flutter/material.dart';
import 'package:litoral_na_mao/common/font/font_style.dart';
import 'package:litoral_na_mao/common/theme/colors.dart';
import 'package:litoral_na_mao/widgets/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/header.dart';

class QuemSomos extends StatelessWidget {
  const QuemSomos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    void closeDrawer() {
      scaffoldKey.currentState!.closeEndDrawer();
    }

    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: ListView(
          children: [
            const Header(),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Text(
                        'Quem Somos',
                        style: TextFontStyle.bold
                            .copyWith(color: ColorPalette.blue, fontSize: 28),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'O Litoral na Mão é uma ferramenta que auxilia seus usuários a encontrar empresas, profissionais liberais, serviços e conteúdos relevantes tanto para o turista quanto para os moradores de sua cidade. ',
                        style: TextFontStyle.regular.copyWith(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'A divisão de conteúdo se apresenta de maneira prática para que o usuário possa filtrar rapidamente o que ele precisa. Seja um profissional para arrumar o encanamento, informações do que está rolando na cidade para um passeio ou para a aquisição de sua nova casa.',
                        style: TextFontStyle.regular.copyWith(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Formatamos nosso conteúdo reunindo os assuntos com maior relevância, porém estamos sempre atualizando para atender a necessidade de nossos usuários que interagem dando sugestõese contribuindo com ações para promover o bem-comum.',
                        style: TextFontStyle.regular.copyWith(fontSize: 18),
                      ),
                    ),
                    Text(
                      'Participe você também !',
                      style: TextFontStyle.medium.copyWith(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: CustomDrawer(onCloseDrawer: closeDrawer),
    );
  }
}
