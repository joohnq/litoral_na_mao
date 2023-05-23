import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:litoral_na_mao/widgets/header.dart';

class Anuncie extends StatelessWidget {
  const Anuncie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: const [
        Header(),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  'Anuncie',
                  style: TextStyle(
                      color: ColorPalette.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
              Text(
                'O Litoral na Mão é a maneira mais simples de encontrar o que você procura na cidade.',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                  'Entre em contato conosco agora mesmo e anuncie sua empresa, produto ou serviço para que seja visto por milhares de usuários do nosso site e aplicativo!',
                  style: TextStyle(fontSize: 18))
            ],
          ),
        ),
      ]),
    );
  }
}
