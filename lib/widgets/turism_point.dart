import 'package:flutter/material.dart';
import 'package:litoral_na_mao/pages/turism_item_page.dart';

class TurismPoint extends StatelessWidget {
  const TurismPoint(
      {Key? key,
      required this.namePoint,
      required this.nameCity,
      required this.imagePoint,
      required this.descPoint})
      : super(key: key);

  final String namePoint;
  final String nameCity;
  final String imagePoint;
  final String descPoint;

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TurismItemPage(
                nameCity: nameCity,
                namePoint: namePoint,
                image: imagePoint,
                desc: descPoint,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            namePoint,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
