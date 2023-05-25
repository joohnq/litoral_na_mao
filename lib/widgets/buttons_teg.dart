// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ButtonsTeg extends StatelessWidget {
  const ButtonsTeg({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final screenSize = sizingInformation.screenSize;
        const smallBreakpoint = 576.0;

        final bool isSmallScreen = screenSize.width < smallBreakpoint;

        return Container(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: buildButton(
                  context,
                  Icons.compare_arrows,
                  'Turismo',
                  '/turism_list',
                  {'nameCity': name},
                  isSmallScreen,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: buildButton(
                  context,
                  Icons.calendar_month,
                  'Eventos',
                  '',
                  null,
                  isSmallScreen,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: buildButton(
                  context,
                  Icons.place,
                  'Guia Comercial',
                  '/guia_comercial_list',
                  {'nameCity': name},
                  isSmallScreen,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  GestureDetector buildButton(
    BuildContext context,
    IconData icon,
    String text,
    String route,
    Map<String, dynamic>? arguments,
    bool isSmallScreen,
  ) {
    return GestureDetector(
      onTap: () {
        Future.delayed(Duration.zero, () {
          final routeF = '/${arguments?['nameCity']}$route';
          context.go(routeF);
        });
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorPalette.blue,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: isSmallScreen ? 40 : 60,
                color: ColorPalette.blue,
              ),
              Text(
                text,
                style: TextStyle(
                  color: ColorPalette.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: isSmallScreen ? 16 : 18,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
