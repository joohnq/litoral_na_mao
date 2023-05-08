import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (MediaQuery.of(context).size.width > 600) {
          return CarouselSlider(
            options: CarouselOptions(
              height: 500.0,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
            ),
            items: [
              'caraguatatuba.jpg',
              'ilhabela.jpg',
              'saosebastiao.jpg',
              'ubatuba.jpg'
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color.fromARGB(255, 235, 98, 48),
                          width: 10,
                        ),
                        bottom: BorderSide(
                          color: Color.fromARGB(255, 235, 98, 48),
                          width: 10,
                        ),
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Color.fromARGB(255, 25, 60, 83),
                            width: 8,
                          ),
                          bottom: BorderSide(
                            color: Color.fromARGB(255, 25, 60, 83),
                            width: 8,
                          ),
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/$i',
                        height: 100,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        } else {
          return CarouselSlider(
            options: CarouselOptions(
              height: 300.0,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
            ),
            items: [
              'caraguatatuba.jpg',
              'ilhabela.jpg',
              'saosebastiao.jpg',
              'ubatuba.jpg'
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color.fromARGB(255, 235, 98, 48),
                          width: 10,
                        ),
                        bottom: BorderSide(
                          color: Color.fromARGB(255, 235, 98, 48),
                          width: 10,
                        ),
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Color.fromARGB(255, 25, 60, 83),
                            width: 8,
                          ),
                          bottom: BorderSide(
                            color: Color.fromARGB(255, 25, 60, 83),
                            width: 8,
                          ),
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/$i',
                        height: 100,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        }
      },
    );
  }
}
