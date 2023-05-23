// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:litoral_na_mao/pages/anuncie.dart';
import 'package:litoral_na_mao/pages/privacidade.dart';
import 'package:litoral_na_mao/pages/quem_somos.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ButtonsQap extends StatelessWidget {
  const ButtonsQap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final screenSize = sizingInformation.screenSize;
        const smallBreakpoint = 576.0;

        if (screenSize.width < smallBreakpoint) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            constraints: const BoxConstraints(
              maxWidth: 1600,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuemSomos(),
                      ),
                    );
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      height: 30,
                      decoration:
                          const BoxDecoration(color: ColorPalette.green),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Quem Somos',
                            style: TextStyle(
                              color: ColorPalette.white,
                              fontWeight: (FontWeight.bold),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Anuncie(),
                      ),
                    );
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      height: 30,
                      decoration:
                          const BoxDecoration(color: ColorPalette.green),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Anuncie',
                            style: TextStyle(
                              color: ColorPalette.white,
                              fontWeight: (FontWeight.bold),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Privacidade(),
                      ),
                    );
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      height: 30,
                      decoration:
                          const BoxDecoration(color: ColorPalette.green),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Privacidade',
                            style: TextStyle(
                              color: ColorPalette.white,
                              fontWeight: (FontWeight.bold),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            constraints: const BoxConstraints(
              maxWidth: 1600,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuemSomos(),
                        ),
                      );
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        height: 30,
                        decoration:
                            const BoxDecoration(color: ColorPalette.green),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Quem Somos',
                              style: TextStyle(
                                color: ColorPalette.white,
                                fontWeight: (FontWeight.bold),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Anuncie(),
                        ),
                      );
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        height: 30,
                        decoration:
                            const BoxDecoration(color: ColorPalette.green),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Anuncie',
                              style: TextStyle(
                                color: ColorPalette.white,
                                fontWeight: (FontWeight.bold),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Privacidade(),
                        ),
                      );
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        height: 30,
                        decoration:
                            const BoxDecoration(color: ColorPalette.green),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Privacidade',
                              style: TextStyle(
                                color: ColorPalette.white,
                                fontWeight: (FontWeight.bold),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
