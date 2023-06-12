import 'package:go_router/go_router.dart';
import 'package:litoral_na_mao/pages/Anuncie/anuncie.dart';
import 'package:litoral_na_mao/pages/Citie/city_detail.dart';
import 'package:litoral_na_mao/pages/GuiaComercial/guia_comercial_item.dart';
import 'package:litoral_na_mao/pages/GuiaComercial/guia_comercial_list.dart';
import 'package:litoral_na_mao/pages/Home/home.dart';
import 'package:litoral_na_mao/pages/Privacidade/privacidade.dart';
import 'package:litoral_na_mao/pages/QuemSomos/quem_somos.dart';
import 'package:litoral_na_mao/pages/Tourism/tourism_item.dart';
import 'package:litoral_na_mao/pages/Tourism/tourism_list.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/:value',
      builder: (context, state) {
        final value = state.pathParameters['value'];
        if (value == 'anuncie') {
          return const Anuncie();
        } else if (value == 'privacidade') {
          return const Privacidade();
        } else if (value == 'quemsomos') {
          return const QuemSomos();
        } else {
          return CityDetail(
            nameCity: state.pathParameters['value'],
          );
        }
      },
    ),
    GoRoute(
      path: '/:nameCity/turism_list',
      builder: (context, state) {
        final nameCity = state.pathParameters['nameCity'];
        return TourismList(
          nameCity: nameCity,
        );
      },
    ),
    GoRoute(
      path: '/:nameCity/turism_list/:namePoint',
      builder: (context, state) {
        final nameCity = state.pathParameters['nameCity'];
        final namePoint = state.pathParameters['namePoint'];
        return TourismItemPage(
          nameCity: nameCity,
          namePoint: namePoint,
          desc: 'Hello World',
        );
      },
    ),
    GoRoute(
      path: '/:nameCity/guia_comercial_list',
      builder: (context, state) {
        final nameCity = state.pathParameters['nameCity'];
        return GuiaComercialList(
          nameCity: nameCity,
        );
      },
    ),
    GoRoute(
      path: '/:nameCity/guia_comercial_list/:namePoint',
      builder: (context, state) {
        final namePoint = state.pathParameters['namePoint'];
        return GuiaComercialItemPage(
          namePoint: namePoint,
        );
      },
    ),
  ],
);
