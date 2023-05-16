import 'package:flutter/material.dart';
import '../pages/citie_detail.dart';

class Citie extends StatelessWidget {
  const Citie({Key? key, required this.name, required this.image})
      : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CitieDetail()),
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints.expand(width: 300, height: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: AssetImage('assets/images/$image'), fit: BoxFit.cover),
            ),
          )
        ]),
      ),
    );
  }
}
