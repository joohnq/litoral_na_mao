import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';
import 'package:litoral_na_mao/pages/guia_comercial_list.dart';
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

        if (screenSize.width < smallBreakpoint) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorPalette.blue, width: 2)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.compare_arrows,
                            size: 40,
                            color: Color.fromARGB(255, 25, 60, 83),
                          ),
                          Text(
                            'Turismo',
                            style: TextStyle(
                              color: ColorPalette.blue,
                              fontWeight: (FontWeight.bold),
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 25, 60, 83),
                              width: 2)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 40,
                            color: Color.fromARGB(255, 25, 60, 83),
                          ),
                          Text(
                            'Eventos',
                            style: TextStyle(
                                color: Color.fromARGB(255, 25, 60, 83),
                                fontWeight: (FontWeight.bold),
                                fontSize: 18),
                          )
                        ],
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
                          builder: (context) => GuiaComercialList(
                            name: name,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 25, 60, 83),
                              width: 2)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.place,
                            size: 40,
                            color: Color.fromARGB(255, 25, 60, 83),
                          ),
                          Text(
                            'Guia',
                            style: TextStyle(
                                color: Color.fromARGB(255, 25, 60, 83),
                                fontWeight: (FontWeight.bold),
                                fontSize: 18),
                          ),
                          Text(
                            'Comercial',
                            style: TextStyle(
                                color: Color.fromARGB(255, 25, 60, 83),
                                fontWeight: (FontWeight.bold),
                                fontSize: 18),
                          )
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
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 25, 60, 83),
                              width: 2),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.compare_arrows,
                              size: 60,
                              color: Color.fromARGB(255, 25, 60, 83),
                            ),
                            Text(
                              'Turismo',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 25, 60, 83),
                                  fontWeight: (FontWeight.bold),
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 25, 60, 83),
                              width: 2)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 60,
                            color: Color.fromARGB(255, 25, 60, 83),
                          ),
                          Text(
                            'Eventos',
                            style: TextStyle(
                                color: Color.fromARGB(255, 25, 60, 83),
                                fontWeight: (FontWeight.bold),
                                fontSize: 18),
                          )
                        ],
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
                          builder: (context) => GuiaComercialList(
                            name: name,
                          ),
                        ),
                      );
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 25, 60, 83),
                                width: 2)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.place,
                              size: 60,
                              color: Color.fromARGB(255, 25, 60, 83),
                            ),
                            Text(
                              'Guia Comercial',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 25, 60, 83),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
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
