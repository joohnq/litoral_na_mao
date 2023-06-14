import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:litoral_na_mao/widgets/Drawer/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/Header/header.dart';

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
      body: ListView(
        children: [
          const Header(),
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text(
                      'Quem Somos',
                      style: TextStyle(
                          color: ColorPalette.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'O Litoral na Mão é uma ferramenta que auxilia seus usuários a encontrar empresas, profissionais liberais, serviços e conteúdos relevantes tanto para o turista quanto para os moradores de sua cidade. ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'A divisão de conteúdo se apresenta de maneira prática para que o usuário possa filtrar rapidamente o que ele precisa. Seja um profissional para arrumar o encanamento, informações do que está rolando na cidade para um passeio ou para a aquisição de sua nova casa.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Formatamos nosso conteúdo reunindo os assuntos com maior relevância, porém estamos sempre atualizando para atender a necessidade de nossos usuários que interagem dando sugestõese contribuindo com ações para promover o bem-comum.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Text(
                    'Participe você também !',
                    style: TextStyle(fontSize: 18),
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
