import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key, required this.images, required this.carouselText})
      : super(key: key);

  final List<String> images;
  final List<String> carouselText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width > 600 ? 500.0 : 300.0,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (MediaQuery.of(context).size.width > 600) {
            return SizedBox(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 500.0,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: images.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          Container(
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
                              height: 500,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Positioned(
                            top: 150,
                            right: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (carouselText.isNotEmpty)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: carouselText.map((text) {
                                      return Text(
                                        text,
                                        style: TextStyle(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: const Offset(2.0, 2.0),
                                              blurRadius: 10.0,
                                              color:
                                                  Colors.black.withOpacity(1),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                if (carouselText.isEmpty)
                                  Container(), // Espaço reservado
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
            );
          } else {
            return SizedBox(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: images.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          Container(
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
                              height: 300,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Positioned(
                            top: 100,
                            right: 20,
                            child: Column(
                              children: [
                                if (carouselText.isNotEmpty)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: carouselText.map((text) {
                                      return Text(
                                        text,
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: const Offset(2.0, 2.0),
                                              blurRadius: 10.0,
                                              color:
                                                  Colors.black.withOpacity(1),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                if (carouselText.isEmpty)
                                  Container(), // Espaço reservado
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
