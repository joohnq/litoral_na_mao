import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:litoral_na_mao/widgets/Drawer/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/FormSearch/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/Header/header.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TurismItemPage extends StatelessWidget {
  const TurismItemPage({
    Key? key,
    required this.nameCity,
    required this.namePoint,
    required this.desc,
  }) : super(key: key);

  final String? nameCity;
  final String? namePoint;
  final String desc;

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
                  Center(
                    child: ResponsiveBuilder(
                      builder: (context, sizingInformation) {
                        final bool isSmallScreen =
                            sizingInformation.screenSize.width < 576;
                        final TextStyle textStyle = TextStyle(
                          color: ColorPalette.green,
                          fontWeight: FontWeight.bold,
                          fontSize: isSmallScreen ? 28 : 40,
                        );
                        return Text(
                          'Turismo - ${nameCity![0].toUpperCase() + nameCity!.substring(1)}',
                          style: textStyle,
                        );
                      },
                    ),
                  ),
                  ResponsiveBuilder(
                    builder: (context, sizingInformation) {
                      final bool isSmallScreen =
                          sizingInformation.screenSize.width < 576;
                      final TextStyle textStyle = TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isSmallScreen ? 24 : 30,
                      );
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Text(
                          namePoint![0].toUpperCase() + namePoint!.substring(1),
                          style: textStyle,
                        ),
                      );
                    },
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Image.asset(
                      'assets/images/caraguatatuba.jpg',
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
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
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
