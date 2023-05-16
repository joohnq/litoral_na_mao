import 'package:flutter/material.dart';

class ButtonQap extends StatelessWidget {
  const ButtonQap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 1600,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FilledButton(
              onPressed: null,
              child: Text('Anuncie'),
            ),
          ),
          Expanded(
            child: FilledButton(
              onPressed: null,
              child: Text('Anuncie'),
            ),
          ),
        ],
      ),
    );
  }
}
