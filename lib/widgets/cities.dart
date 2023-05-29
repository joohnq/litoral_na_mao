import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:litoral_na_mao/widgets/city.dart';

class Cities extends StatelessWidget {
  const Cities({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final screenSize = sizingInformation.screenSize;
        const smallBreakpoint = 576.0;
        const mediumBreakpoint = 992.0;
        const highBreakpoint = 1820.0;

        if (screenSize.width < smallBreakpoint) {
          return const Column(
            children: [
              City(name: 'caraguatatuba'),
              City(name: 'ilhabela'),
              City(name: 'saosebastiao'),
              City(name: 'ubatuba'),
            ],
          );
        } else if (screenSize.width < mediumBreakpoint) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  children: [
                    City(name: 'caraguatatuba'),
                    City(name: 'ilhabela'),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    City(name: 'saosebastiao'),
                    City(name: 'ubatuba'),
                  ],
                ),
              ),
            ],
          );
        } else if (screenSize.width < highBreakpoint) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    City(name: 'caraguatatuba'),
                    City(name: 'ilhabela'),
                    City(name: 'saosebastiao'),
                    City(name: 'ubatuba'),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Flexible(
                  fit: FlexFit.tight,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      City(name: 'caraguatatuba'),
                      City(name: 'ilhabela'),
                      City(name: 'saosebastiao'),
                      City(name: 'ubatuba'),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
