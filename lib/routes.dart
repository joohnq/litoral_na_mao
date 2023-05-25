import 'package:go_router/go_router.dart';
import 'package:litoral_na_mao/pages/city_detail.dart';
import 'package:litoral_na_mao/pages/guia_comercial_item.dart';
import 'package:litoral_na_mao/pages/guia_comercial_list.dart';
import 'package:litoral_na_mao/pages/home.dart';
import 'package:litoral_na_mao/pages/turism_list.dart';
// import 'package:litoral_na_mao/widgets/guia_comercial_point.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/:nameCity',
      builder: (context, state) => CityDetail(
        nameCity: state.pathParameters['nameCity'],
      ),
    ),
    GoRoute(
      path: '/:nameCity/turism_list',
      builder: (context, state) {
        final nameCity = state.pathParameters['nameCity'];
        return TurismList(
          nameCity: nameCity,
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
      path: '/:nameCity/guia_comercial_list/guia_comercial_item/:namePoint',
      builder: (context, state) {
        final namePoint = state.pathParameters['namePoint'];
        return GuiaComercialItemPage(
          namePoint: namePoint,
        );
      },
    ),
  ],
);
