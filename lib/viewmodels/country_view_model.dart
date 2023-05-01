import 'package:country/abstracts/country_repository.dart';
import 'package:country/models/country.dart';
import 'package:flutter/material.dart';

class CountryViewModel extends ChangeNotifier {
  CountryViewModel({required CountryRepository countryRepo}) {
    _countryRepo = countryRepo;
  }

  late CountryRepository _countryRepo;

  Future<List<Country>> getCountryList() async {
    final response = await _countryRepo.getCountryList();
    notifyListeners();
    return response;
  }

  Future<List<Country>> getCountry({required String name}) async {
    final response = await _countryRepo.getCountry(name: name);
    notifyListeners();
    return response;
  }
}
