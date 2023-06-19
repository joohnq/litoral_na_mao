import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:litoral_na_mao/pages/anuncie.dart';
import 'package:litoral_na_mao/pages/city_detail.dart';
import 'package:litoral_na_mao/pages/commercial_guide_item.dart';
import 'package:litoral_na_mao/pages/commercial_guide_list.dart';
import 'package:litoral_na_mao/pages/home.dart';
import 'package:litoral_na_mao/pages/privacidade.dart';
import 'package:litoral_na_mao/pages/quem_somos.dart';
import 'package:litoral_na_mao/pages/tourism_item.dart';
import 'package:litoral_na_mao/pages/tourism_list.dart';
import 'package:litoral_na_mao/pages/tourism_list_category.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Litoral na Mão',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const Home()),
        GetPage(name: '/quemsomos', page: () => const QuemSomos()),
        GetPage(name: '/anuncie', page: () => const Anuncie()),
        GetPage(name: '/privacidade', page: () => const Privacidade()),
        GetPage(
          name: '/:value',
          page: () => CityDetail(),
        ),
        GetPage(name: '/:nameCity/tourism', page: () => TourismListCategory()),
        GetPage(
            name: '/:nameCity/tourism/:nameCategory',
            page: () => TourismList()),
        GetPage(
            name: '/:nameCity/tourism/:category/:namePoint',
            page: () => TourismItemPage()),
        GetPage(
            name: '/:nameCity/commercialguide',
            page: () => CommercialGuideList()),
        GetPage(
            name: '/:nameCity/commercialguide/:namePoint',
            page: () => CommercialGuideItemPage()),
      ],
    );
  }
}
