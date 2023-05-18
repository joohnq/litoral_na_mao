import 'package:flutter/material.dart';
import 'package:litoral_na_mao/components/drawer_litoral.dart';
import 'package:litoral_na_mao/components/form_search_bar.dart';
import 'package:litoral_na_mao/components/header.dart';
import 'package:litoral_na_mao/components/turism_point.dart';

class TurismList extends StatelessWidget {
  const TurismList({Key? key, required this.name}) : super(key: key);

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
          children: const [
            Header(),
            FormSearchBar(),
            Center(
              child: Wrap(children: [
                TurismPoint(),
                SizedBox(
                  width: 10,
                ),
                TurismPoint(),
                SizedBox(
                  width: 10,
                ),
                TurismPoint(),
                SizedBox(
                  width: 10,
                ),
                TurismPoint()
              ]),
            )
          ],
        ),
        endDrawer: CustomDrawer(onCloseDrawer: closeDrawer));
  }
}
