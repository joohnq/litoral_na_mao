import 'package:flutter/material.dart';
import 'package:litoral_na_mao/app/data/http/exceptions.dart';
import 'package:litoral_na_mao/app/data/models/city_model.dart';
import 'package:litoral_na_mao/app/data/repositiories/city_repository.dart';

class CityStore {
  final ACityRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<CityModel>> state =
      ValueNotifier<List<CityModel>>([]);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  CityStore({required this.repository});

  Future getCities() async {
    isLoading.value = true;

    try {
      final result = await repository.getCities();
      state.value = result;
    } on NotFoundException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}
