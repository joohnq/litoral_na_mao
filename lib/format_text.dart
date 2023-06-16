String removerEspacosLetrasMaiusculas(String texto) {
  String textoSemEspacos = texto.replaceAll(' ', '');
  String textoMinusculo = textoSemEspacos.toLowerCase();
  return textoMinusculo;
}
