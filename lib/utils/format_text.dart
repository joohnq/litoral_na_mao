import 'package:diacritic/diacritic.dart';

String removerEspacosLetrasMaiusculas(String texto) {
  String textoSemEspacos = texto.replaceAll(' ', '');
  String textoMinusculo = textoSemEspacos.toLowerCase();
  String textoSemCaracteres = removeDiacritics(textoMinusculo);

  return textoSemCaracteres;
}

String formatPhoneNumber(String phoneNumber) {
  final numericString = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
  if (numericString.length == 11) {
    final areaCode = numericString.substring(0, 2);
    final firstDigits = numericString.substring(2, 7);
    final lastDigits = numericString.substring(7);

    return '($areaCode) $firstDigits-$lastDigits';
  } else {
    return phoneNumber;
  }
}
