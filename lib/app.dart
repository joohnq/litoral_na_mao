import 'package:flutter/material.dart';
import 'package:litoral_na_mao/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Litoral na Mão',
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}
 // routes: {
      //   '/': (context) => const Home(),
      //   '/city_detail/': (context) {
      //     final arguments = ModalRoute.of(context)?.settings.arguments
      //         as Map<String, dynamic>?;
      //     return CityDetail(
      //       nameCity: arguments?['nameCity'] as String?,
      //       image: arguments?['image'] as String?,
      //     );
      //   },
      //   '/turism_list': (context) {
      //     final arguments = ModalRoute.of(context)?.settings.arguments
      //         as Map<String, dynamic>?;
      //     return TurismList(
      //       nameCity: arguments?['nameCity'] as String?,
      //     );
      //   },
      //   '/guia_comercial_list': (context) {
      //     final arguments = ModalRoute.of(context)?.settings.arguments
      //         as Map<String, dynamic>?;
      //     return GuiaComercialList(
      //       name: arguments?['name'] as String?,
      //     );
      //   },
      //   '/guia_comercial_item': (context) {
      //     final arguments = ModalRoute.of(context)?.settings.arguments
      //         as Map<String, dynamic>?;
      //     return GuiaComercialItemPage(
      //       namePoint: arguments?['namePoint'] as String?,
      //     );
      //   },
      //   '/privacidade': (context) => const Privacidade(),
      //   '/anuncie': (context) => const Anuncie(),
      //   '/quem_somos': (context) => const QuemSomos(),
      // },