import 'package:dio/dio.dart';
import 'package:litoral_na_mao/models/city.dart';

final dio = Dio();

Future<List<City>> getHttp() async {
  Response response;
  try {
    response = await dio.get('https://api-litoral.vercel.app/api/cities');
    final data = response.data['cities'] as List<dynamic>;
    final cities = data.map((item) => City.fromJson(item)).toList();
    return cities;
  } catch (error) {
    Exception('Erro ao buscar os dados da API: $error');
    rethrow;
  }
}
