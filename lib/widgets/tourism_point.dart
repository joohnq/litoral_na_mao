import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:litoral_na_mao/utils/format_text.dart';

class TourismPoint extends StatelessWidget {
  const TourismPoint(
      {Key? key,
      required this.namePoint,
      required this.nameCity,
      required this.descPoint,
      required this.category})
      : super(key: key);

  final String namePoint;
  final String nameCity;
  final String descPoint;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          context.go(
              '/$nameCity/tourism/$category/${removerEspacosLetrasMaiusculas(namePoint)}');
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            namePoint[0].toUpperCase() + namePoint.substring(1),
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
