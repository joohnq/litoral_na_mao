import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:litoral_na_mao/widgets/citie.dart';

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
              Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
              Citie(name: 'Ilha Bela', image: 'ilhabela.jpg'),
              Citie(name: 'São Sebastião', image: 'saosebastiao.jpg'),
              Citie(name: 'Ubatuba', image: 'ubatuba.jpg'),
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
                    Citie(name: 'Ilha Bela', image: 'ilhabela.jpg'),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    Citie(name: 'São Sebastião', image: 'saosebastiao.jpg'),
                    Citie(name: 'Ubatuba', image: 'ubatuba.jpg'),
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
                    Citie(name: 'Ilha Bela', image: 'ilhabela.jpg'),
                    Citie(name: 'São Sebastião', image: 'saosebastiao.jpg'),
                    Citie(name: 'Ubatuba', image: 'ubatuba.jpg'),
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
                      Citie(name: 'Caraguatatuba', image: 'caraguatatuba.jpg'),
                      Citie(name: 'Ilha Bela', image: 'ilhabela.jpg'),
                      Citie(name: 'São Sebastião', image: 'saosebastiao.jpg'),
                      Citie(name: 'Ubatuba', image: 'ubatuba.jpg'),
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
