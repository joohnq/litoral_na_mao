import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litoral_na_mao/common/font/font_style.dart';
import 'package:litoral_na_mao/common/theme/colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ButtonsQap extends StatelessWidget {
  const ButtonsQap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final screenSize = sizingInformation.screenSize;
        const smallBreakpoint = 576.0;

        final bool isSmallScreen = screenSize.width < smallBreakpoint;

        return Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          constraints: const BoxConstraints(maxWidth: 1600),
          child: isSmallScreen
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildButton(context, 'Quem Somos', '/quemsomos'),
                    const SizedBox(height: 10),
                    buildButton(context, 'Anuncie', '/anuncie'),
                    const SizedBox(height: 10),
                    buildButton(context, 'Privacidade', '/privacidade'),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: buildButton(context, 'Quem Somos', '/quemsomos'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: buildButton(context, 'Anuncie', '/anuncie'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child:
                          buildButton(context, 'Privacidade', '/privacidade'),
                    ),
                  ],
                ),
        );
      },
    );
  }

  GestureDetector buildButton(BuildContext context, String text, String route) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(route);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: ColorPalette.green,
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              text,
              style: TextFontStyle.semiBold.copyWith(
                color: ColorPalette.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
