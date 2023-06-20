import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litoral_na_mao/common/font/font_style.dart';
import 'package:litoral_na_mao/common/theme/colors.dart';
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
                  '/tourism',
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
                  '/events',
                  {'nameCity': name},
                  isSmallScreen,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: buildButton(
                  context,
                  Icons.place,
                  'Guia Comercial',
                  '/commercialguide',
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
        Get.toNamed('/${arguments?['nameCity']}$route');
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: ColorPalette.blue, borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: isSmallScreen ? 40 : 60,
                color: ColorPalette.white,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                text,
                style: TextFontStyle.semiBold.copyWith(
                  color: ColorPalette.white,
                  fontSize: isSmallScreen ? 14 : 18,
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
