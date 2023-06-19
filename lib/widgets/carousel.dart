import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:litoral_na_mao/common/font/font_style.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key, required this.images, required this.carouselText})
      : super(key: key);

  final List<String> images;
  final List<String> carouselText;

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width > 600;
    final double carouselHeight = isLargeScreen ? 500.0 : 300.0;
    final double fontSize = isLargeScreen ? 45 : 28;
    final double topPosition = isLargeScreen ? 150 : 100;

    return SizedBox(
      height: carouselHeight,
      child: CarouselSlider(
        options: CarouselOptions(
          height: carouselHeight,
          viewportFraction: 1.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
        ),
        items: images.map(
          (i) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    SizedBox(
                      child: Image.network(
                        i,
                        height: carouselHeight,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Positioned(
                      top: topPosition,
                      right: isLargeScreen ? 50 : 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (carouselText.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: carouselText.map(
                                (text) {
                                  return Text(
                                    text,
                                    style: TextFontStyle.bold.copyWith(
                                      fontSize: fontSize,
                                      color: Colors.white,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: const Offset(2.0, 2.0),
                                          blurRadius: 10.0,
                                          color: Colors.black.withOpacity(1),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ).toList(),
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
          },
        ).toList(),
      ),
    );
  }
}
