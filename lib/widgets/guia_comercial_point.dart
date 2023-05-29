// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:litoral_na_mao/colors.dart';

class GuiaComercialPoint extends StatefulWidget {
  const GuiaComercialPoint({Key? key, required this.nameCity})
      : super(key: key);

  final String? nameCity;

  @override
  State<GuiaComercialPoint> createState() => GuiaComercialPointState();
}

class GuiaComercialPointState extends State<GuiaComercialPoint> {
  bool showFirstWidget = true;

  void toggleWidget() {
    setState(() {
      showFirstWidget = !showFirstWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        constraints: const BoxConstraints(maxWidth: 400),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 10),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: showFirstWidget
              ? FirstWidget(
                  key: const ValueKey(1),
                  onToggle: toggleWidget,
                )
              : SecondWidget(
                  key: const ValueKey(2),
                  onToggle: toggleWidget,
                  nameCity: widget.nameCity,
                ),
        ),
      ),
    );
  }
}

class FirstWidget extends StatelessWidget {
  const FirstWidget({Key? key, required this.onToggle}) : super(key: key);
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Row(children: [
        Container(
          width: 120,
          height: 120,
          decoration: const BoxDecoration(color: Colors.black12),
        ),
        const SizedBox(width: 10),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CIDADE',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Descrição',
                style: TextStyle(color: ColorPalette.orange, fontSize: 18),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Localização',
                  style: TextStyle(color: ColorPalette.lightGray, fontSize: 18),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class SecondWidget extends StatelessWidget {
  const SecondWidget({Key? key, required this.onToggle, required this.nameCity})
      : super(key: key);

  final VoidCallback onToggle;
  final String? nameCity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      onLongPress: () {
        context.go('/$nameCity/guia_comercial_list/$nameCity');
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 1),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        width: 400,
        height: 200,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20)),
                      color: Colors.black12),
                ),
                const SizedBox(width: 10),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CIDADE',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Descrição',
                        style:
                            TextStyle(color: ColorPalette.orange, fontSize: 18),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Localização',
                          style: TextStyle(
                              color: ColorPalette.lightGray, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => print('hello'),
                      child: const Icon(Icons.extension, size: 50)),
                  GestureDetector(
                      onTap: () => print('hello'),
                      child: const Icon(Icons.extension, size: 50)),
                  GestureDetector(
                      onTap: () => print('hello'),
                      child: const Icon(Icons.extension, size: 50)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
