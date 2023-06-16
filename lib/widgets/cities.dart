import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:litoral_na_mao/widgets/city.dart';

class Cities extends StatelessWidget {
  final List<Map<String, String>> cities;

  const Cities({Key? key, required this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final screenSize = sizingInformation.screenSize;

        if (screenSize.width < 576.0) {
          return Column(
            children: _buildCity(cities),
          );
        } else {
          return Wrap(
            children: _buildCity(cities),
          );
        }
      },
    );
  }

  List<Widget> _buildCity(List<Map<String, String>> cities) {
    return cities.map((city) {
      return City(name: city['name']!, image: city['image']!);
    }).toList();
  }
}
