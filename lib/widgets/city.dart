import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litoral_na_mao/common/font/font_style.dart';
import 'package:litoral_na_mao/utils/format_text.dart';

class City extends StatelessWidget {
  const City({Key? key, required this.name, required this.image})
      : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/${removerEspacosLetrasMaiusculas(name)}', arguments: {
          'nameCity': removerEspacosLetrasMaiusculas(name),
        });
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  name[0].toUpperCase() + name.substring(1),
                  style: TextFontStyle.medium.copyWith(fontSize: 22),
                ),
              ),
              Container(
                constraints:
                    const BoxConstraints.expand(width: 400, height: 350),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
