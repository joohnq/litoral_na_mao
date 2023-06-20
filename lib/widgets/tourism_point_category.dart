import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litoral_na_mao/utils/format_text.dart';

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
          Get.toNamed(
            '/${removerEspacosLetrasMaiusculas(nameCity)}/tourism/${removerEspacosLetrasMaiusculas(nameCategory)}',
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            nameCategory[0].toUpperCase() + nameCategory.substring(1),
            style: const TextStyle(
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
