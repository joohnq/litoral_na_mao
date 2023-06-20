import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litoral_na_mao/common/font/font_style.dart';
import 'package:litoral_na_mao/common/theme/colors.dart';
import 'package:litoral_na_mao/utils/format_text.dart';

class CommercialGuidePoint extends StatefulWidget {
  const CommercialGuidePoint(
      {Key? key,
      required this.namePoint,
      required this.nameCity,
      required this.descPoint,
      required this.locationPoint})
      : super(key: key);

  final String? nameCity;
  final String? namePoint;
  final String? descPoint;
  final String? locationPoint;

  @override
  State<CommercialGuidePoint> createState() => GuiaComercialPointState();
}

class GuiaComercialPointState extends State<CommercialGuidePoint> {
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
                  pointData: {
                    "name": widget.namePoint,
                    "desc": widget.descPoint,
                    "location": widget.locationPoint
                  },
                  onToggle: toggleWidget,
                )
              : SecondWidget(
                  key: const ValueKey(2),
                  pointData: {
                    "name": widget.namePoint,
                    "desc": widget.descPoint,
                    "location": widget.locationPoint
                  },
                  onToggle: toggleWidget,
                  nameCity: widget.nameCity,
                ),
        ),
      ),
    );
  }
}

class FirstWidget extends StatelessWidget {
  final Map pointData;
  final VoidCallback onToggle;
  const FirstWidget({Key? key, required this.pointData, required this.onToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(color: Colors.black12),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 250),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pointData['name'],
                    style: TextFontStyle.semiBold.copyWith(fontSize: 20),
                  ),
                  Text(
                    pointData['desc'],
                    style: TextFontStyle.regular
                        .copyWith(fontSize: 14, color: ColorPalette.orange),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      pointData['location'],
                      style: TextFontStyle.medium.copyWith(
                          fontSize: 14, color: ColorPalette.lightGray),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SecondWidget extends StatelessWidget {
  final Map pointData;
  final VoidCallback onToggle;
  final String? nameCity;
  const SecondWidget(
      {Key? key,
      required this.pointData,
      required this.onToggle,
      required this.nameCity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      onDoubleTap: () {
        Get.toNamed(
          "/$nameCity/commercialguide/${removerEspacosLetrasMaiusculas(pointData['name'])}",
          arguments: {
            "namePoint": pointData['name'],
            "desc": pointData['desc'],
            "location": pointData['location'],
          },
        );
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 1),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        width: 400,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 250),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pointData['name'],
                          style: TextFontStyle.semiBold.copyWith(fontSize: 20),
                        ),
                        Text(
                          pointData['desc'],
                          style: TextFontStyle.regular.copyWith(
                              fontSize: 14, color: ColorPalette.orange),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            pointData['location'],
                            style: TextFontStyle.medium.copyWith(
                                fontSize: 14, color: ColorPalette.lightGray),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.extension, size: 50)),
                  GestureDetector(
                      onTap: () => {},
                      child: const Icon(Icons.extension, size: 50)),
                  GestureDetector(
                      onTap: () => {},
                      child: const Icon(Icons.extension, size: 50)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
