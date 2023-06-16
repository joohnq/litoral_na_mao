import 'package:flutter/material.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(T value) builder;

  const CustomFutureBuilder({
    Key? key,
    required this.future,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Erro ao buscar os dados da API'),
          );
        } else if (snapshot.hasData) {
          final value = snapshot.data as T;
          return builder(value);
        } else {
          return const Center(
            child: Text('Nenhum dado disponível'),
          );
        }
      },
    );
  }
}
