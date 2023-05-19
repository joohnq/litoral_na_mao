import 'package:flutter/material.dart';
import 'package:litoral_na_mao/components/drawer_litoral.dart';
import 'package:litoral_na_mao/components/form_search_bar.dart';
import 'package:litoral_na_mao/components/header.dart';
import 'package:litoral_na_mao/components/guia_comercial_point.dart';

class GuiaComercialList extends StatelessWidget {
  const GuiaComercialList({Key? key, required this.name}) : super(key: key);

  final String name;

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
            const FormSearchBar(),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Wrap(children: [
                  GuiaComercialPoint(name: name),
                  const SizedBox(
                    width: 10,
                  ),
                  GuiaComercialPoint(name: name),
                  const SizedBox(
                    width: 10,
                  ),
                  GuiaComercialPoint(name: name),
                  const SizedBox(
                    width: 10,
                  ),
                  GuiaComercialPoint(name: name),
                  const SizedBox(
                    width: 10,
                  ),
                  GuiaComercialPoint(name: name),
                  const SizedBox(
                    width: 10,
                  ),
                  GuiaComercialPoint(name: name),
                  const SizedBox(
                    width: 10,
                  ),
                  GuiaComercialPoint(name: name),
                ]),
              ),
            )
          ],
        ),
        endDrawer: CustomDrawer(onCloseDrawer: closeDrawer));
  }
}
