import 'package:flutter/material.dart';
import 'package:litoral_na_mao/colors.dart';

class FormSearchBar extends StatelessWidget {
  const FormSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: const Color.fromARGB(255, 25, 60, 83),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: ColorPalette.white,
                    hintText: 'Digite algo...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ), // Espaçamento entre o campo de entrada e o ícone
              const SizedBox(
                width: 30, // Largura fixa do ícone
                child: Icon(
                  Icons.search,
                  color: ColorPalette.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
