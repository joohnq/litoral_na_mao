import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litoral_na_mao/common/font/font_style.dart';
import 'package:litoral_na_mao/common/theme/colors.dart';
import 'package:litoral_na_mao/models/city.dart';
import 'package:litoral_na_mao/services/api_service.dart';
import 'package:litoral_na_mao/widgets/drawer_litoral.dart';
import 'package:litoral_na_mao/widgets/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/header.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TourismItemPage extends StatefulWidget {
  final nameCity = Get.arguments['nameCity'];
  final namePoint = Get.arguments['namePoint'];
  final desc = Get.arguments['desc'];
  TourismItemPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TourismItemPage> createState() => _TourismItemPageState();
}

class _TourismItemPageState extends State<TourismItemPage> {
  late Future<List<City>> futureCities;

  @override
  void initState() {
    super.initState();
    futureCities = fetchApi();
  }

  Future<List<City>> fetchApi() async {
    return await getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Header(),
            const FormSearchBar(),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ResponsiveBuilder(
                        builder: (context, sizingInformation) {
                          final bool isSmallScreen =
                              sizingInformation.screenSize.width < 576;
                          final TextStyle textStyle = TextStyle(
                            color: ColorPalette.green,
                            fontWeight: FontWeight.bold,
                            fontSize: isSmallScreen ? 28 : 40,
                          );
                          return Text(
                            'Turismo - ${widget.nameCity![0].toUpperCase() + widget.nameCity!.substring(1)}',
                            style: textStyle,
                          );
                        },
                      ),
                    ),
                    ResponsiveBuilder(
                      builder: (context, sizingInformation) {
                        final bool isSmallScreen =
                            sizingInformation.screenSize.width < 576;
                        final TextStyle textStyle = TextFontStyle.bold.copyWith(
                          fontSize: isSmallScreen ? 24 : 30,
                        );
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text(
                            widget.namePoint![0].toUpperCase() +
                                widget.namePoint!.substring(1),
                            style: textStyle,
                          ),
                        );
                      },
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: Image.asset(
                        'assets/images/caraguatatuba.jpg',
                        height: 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Text(
                        widget.desc,
                        style: TextFontStyle.medium.copyWith(
                          fontSize: 18,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: CustomDrawer(
        onCloseDrawer: () {
          Scaffold.of(context).openEndDrawer();
        },
      ),
    );
  }
}
