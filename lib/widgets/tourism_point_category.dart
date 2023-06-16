import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TourismPointCategory extends StatelessWidget {
  final String nameCity;
  final String nameCategory;

  const TourismPointCategory({
    Key? key,
    required this.nameCity,
    required this.nameCategory,
  }) : super(key: key);

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
              '/$nameCity/tourism/${nameCategory[0].toLowerCase() + nameCategory.substring(1)}');
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            nameCategory[0].toUpperCase() + nameCategory.substring(1),
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
