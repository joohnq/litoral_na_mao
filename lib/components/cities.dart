import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'citie.dart';

class Cities extends StatelessWidget {
  const Cities({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final screenSize = sizingInformation.screenSize;
        const smallBreakpoint = 576.0;
        const mediumBreakpoint = 992.0;
        const highBreakpoint = 1420.0;

        if (screenSize.width < smallBreakpoint) {
          return const Column(
            children: [
              Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
              Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
              Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
              Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
            ],
          );
        } else if (screenSize.width < mediumBreakpoint) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  children: [
                    Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
                    Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
                    Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
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
                    Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
                    Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
                    Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
                    Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
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
                width: 1400,
                child: Flexible(
                  fit: FlexFit.tight,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
                      Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
                      Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
                      Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
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
