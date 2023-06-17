import 'package:flutter/material.dart';
import 'package:litoral_na_mao/common/theme/colors.dart';

class FormSearchBar extends StatelessWidget {
  const FormSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: ColorPalette.blue,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20),
                      filled: true,
                      fillColor: ColorPalette.white,
                      hintText: 'Digite algo...',
                      hintStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            5), // Valor do border radius desejado
                        borderSide: BorderSide.none, // Removendo a borda
                      ),
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
