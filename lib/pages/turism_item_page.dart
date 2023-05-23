import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:litoral_na_mao/widgets/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/header.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TurismItemPage extends StatelessWidget {
  const TurismItemPage(
      {Key? key,
      required this.nameCity,
      required this.namePoint,
      required this.image,
      required this.desc})
      : super(key: key);

  final String nameCity;
  final String namePoint;
  final String image;
  final String desc;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    void closeDrawer() {
      scaffoldKey.currentState!.closeEndDrawer();
    }

    return Scaffold(
      key: scaffoldKey,
      body: ListView(children: [
        const Header(),
        const FormSearchBar(),
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: ResponsiveBuilder(
                    builder: (context, sizingInformation) {
                      if (sizingInformation.screenSize.width < 576) {
                        return Text(
                          'Turismo - $nameCity',
                          style: const TextStyle(
                              color: ColorPalette.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        );
                      } else {
                        return Text(
                          'Turismo - $nameCity',
                          style: const TextStyle(
                              color: ColorPalette.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        );
                      }
                    },
                  ),
                ),
                ResponsiveBuilder(
                  builder: (context, sizingInformation) {
                    if (sizingInformation.screenSize.width < 576) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Text(
                          namePoint,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Text(
                          namePoint,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      );
                    }
                  },
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Image.asset(
                    'assets/images/$image',
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Text(
                    desc,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        height: 1.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
      endDrawer: CustomDrawer(onCloseDrawer: closeDrawer),
    );
  }
}
