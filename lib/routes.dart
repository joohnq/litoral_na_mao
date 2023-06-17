// import 'package:go_router/go_router.dart';
// import 'package:litoral_na_mao/pages/anuncie.dart';
// import 'package:litoral_na_mao/pages/city_detail.dart';
// import 'package:litoral_na_mao/pages/commercial_guide_item.dart';
// import 'package:litoral_na_mao/pages/commercial_guide_list.dart';
// import 'package:litoral_na_ges/privacidade.dart';
// import 'package:litoral_na_mao/pages/quem_somos.dart';
// import 'package:litoral_na_mao/pages/tourism_item.dart';
// import 'package:litoral_na_mao/pages/tourism_list.dart';
// import 'package:litoral_na_mao/pages/tourism_list_category.dart';

// final routes = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const Home(),
//     ),
//     GoRoute(mao/pages/home.dart';
// import 'package:litoral_na_mao/pa
//       path: '/:value',
//       builder: (context, state) {
//         final value = state.pathParameters['value'];
//         if (value == 'anuncie') {
//           return const Anuncie();
//         } else if (value == 'privacidade') {
//           return const Privacidade();
//         } else if (value == 'quemsomos') {
//           return const QuemSomos();
//         } else {
//           return CityDetail(
//             nameCity: state.pathParameters['value'],
//           );
//         }
//       },
//     ),
//     GoRoute(
//       path: '/:nameCity/tourism',
//       builder: (context, state) {
//         final nameCity = state.pathParameters['nameCity'];
//         return TourismListCategory(
//           nameCity: nameCity,
//         );
//       },
//     ),
//     GoRoute(
//       path: '/:nameCity/tourism/:category/:namePoint',
//       builder: (context, state) {
//         final nameCity = state.pathParameters['nameCity'];
//         final namePoint = state.pathParameters['namePoint'];
//         return TourismItemPage(
//           nameCity: nameCity,
//           namePoint: namePoint,
//           desc: 'Hello World',
//         );
//       },
//     ),
//     GoRoute(
//       path: '/:nameCity/tourism/:nameCategory',
//       builder: (context, state) {
//         final nameCity = state.pathParameters['nameCity'];
//         final nameCategory = state.pathParameters['nameCategory'];
//         return TourismList(
//           nameCity: nameCity,
//           nameCategory: nameCategory,
//         );
//       },
//     ),
//     GoRoute(
//       path: '/:nameCity/commercialguide',
//       builder: (context, state) {
//         final nameCity = state.pathParameters['nameCity'];
//         return CommercialGuideList(
//           nameCity: nameCity,
//         );
//       },
//     ),
//     GoRoute(
//       path: '/:nameCity/commercialguide/:namePoint',
//       builder: (context, state) {
//         final namePoint = state.pathParameters['namePoint'];
//         return CommercialGuideItemPage(
//           namePoint: namePoint,
//         );
//       },
//     ),
//   ],
// );
