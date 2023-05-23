import 'package:flutter/material.dart';
import 'package:litoral_na_mao/widgets/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/header.dart';
import 'package:litoral_na_mao/widgets/turism_point.dart';

class TurismList extends StatelessWidget {
  const TurismList({Key? key, required this.nameCity}) : super(key: key);

  final String nameCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Header(),
          const FormSearchBar(),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TurismPoint(
                      nameCity: nameCity,
                      namePoint: 'Brava',
                      imagePoint: 'caraguatatuba.jpg',
                      descPoint: 'Description',
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
