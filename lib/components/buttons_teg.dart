import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ButtonsTeg extends StatelessWidget {
  const ButtonsTeg({Key? key}) : super(key: key);

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
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 25, 60, 83),
                            width: 1)),
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
                          style:
                              TextStyle(color: Color.fromARGB(255, 25, 60, 83)),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 25, 60, 83),
                            width: 1)),
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
                          style:
                              TextStyle(color: Color.fromARGB(255, 25, 60, 83)),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 25, 60, 83),
                            width: 1)),
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
                          style:
                              TextStyle(color: Color.fromARGB(255, 25, 60, 83)),
                        ),
                        Text(
                          'Comercial',
                          style:
                              TextStyle(color: Color.fromARGB(255, 25, 60, 83)),
                        )
                      ],
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
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 25, 60, 83),
                          width: 1),
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
                          style:
                              TextStyle(color: Color.fromARGB(255, 25, 60, 83)),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 25, 60, 83),
                            width: 1)),
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
                          style:
                              TextStyle(color: Color.fromARGB(255, 25, 60, 83)),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 25, 60, 83),
                            width: 1)),
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
                          style:
                              TextStyle(color: Color.fromARGB(255, 25, 60, 83)),
                        )
                      ],
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
