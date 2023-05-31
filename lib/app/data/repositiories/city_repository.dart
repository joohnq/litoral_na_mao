import 'dart:convert';

import 'package:litoral_na_mao/app/data/http/exceptions.dart';
import 'package:litoral_na_mao/app/data/http/http_client.dart';
import 'package:litoral_na_mao/app/data/models/city_model.dart';

abstract class ACityRepository {
  Future<List<CityModel>> getCities();
}

class CityRepository implements ACityRepository {
  final AHttpClient client;

  CityRepository({required this.client});

  @override
  Future<List<CityModel>> getCities() async {
    final response = await client.get(url: 'https://api.litoral.com');

    if (response.statusCode == 200) {
      final List<CityModel> cities = [];
      final body = jsonDecode(response.body);

      body["cities"].map((item) {
        final CityModel city = CityModel.fromMap(item);
        cities.add(city);
      }).toList();

      return cities;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A URL informada não é válida');
    } else {
      throw Exception("Não foi possivel carregar as cidades");
    }
  }
}
