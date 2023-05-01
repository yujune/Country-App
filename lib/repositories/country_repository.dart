import 'package:country/models/country.dart';
import 'package:dio/dio.dart';
import 'package:country/abstracts/api_service.dart';
import 'package:country/abstracts/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository {
  CountryRepositoryImpl({required ApiService service}) {
    _apiService = service;
  }

  late ApiService _apiService;

  @override
  Future<List<Country>> getCountryList() async {
    try {
      final response = await _apiService.getCountryList();
      final data = response.data as List<dynamic>;
      final countryList =
          data.map((country) => Country.fromMap(country)).toList();
      return countryList;
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<Country> getCountry({required String name}) async {
    try {
      final response = await _apiService.getCountry(name: name);
      final country = Country.fromMap(response.data);
      return country;
    } on DioError {
      rethrow;
    }
  }
}
