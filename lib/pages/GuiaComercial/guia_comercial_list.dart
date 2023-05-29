import 'package:flutter/material.dart';
import 'package:litoral_na_mao/widgets/Drawer/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/FormSearch/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/Header/header.dart';
import 'package:litoral_na_mao/widgets/GuiaComercial/guia_comercial_point.dart';

class GuiaComercialList extends StatelessWidget {
  const GuiaComercialList({
    Key? key,
    required this.nameCity,
  }) : super(key: key);

  final String? nameCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Header(),
          const FormSearchBar(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                spacing: 10,
                children: List.generate(
                  10,
                  (_) => GuiaComercialPoint(nameCity: nameCity ?? ''),
                ),
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
}
