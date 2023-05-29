import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:litoral_na_mao/colors.dart';
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
        context.go(route);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          height: 30,
          decoration: const BoxDecoration(color: ColorPalette.green),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: ColorPalette.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
