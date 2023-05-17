// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    backgroundColor: const Color.fromARGB(255, 8, 183, 176),
                  ),
                  onPressed: () => print('hello'),
                  child: const Text('Quem Somos'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 8, 183, 176),
                  ),
                  onPressed: () => print('hello'),
                  child: const Text('Anuncie'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 8, 183, 176),
                  ),
                  onPressed: () => print('hello'),
                  child: const Text('Privacidade'),
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
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      backgroundColor: const Color.fromARGB(255, 8, 183, 176),
                    ),
                    onPressed: () => print('hello'),
                    child: const Text('Quem Somos'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 8, 183, 176),
                    ),
                    onPressed: () => print('hello'),
                    child: const Text('Anuncie'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 8, 183, 176),
                    ),
                    onPressed: () => print('hello'),
                    child: const Text('Privacidade'),
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
