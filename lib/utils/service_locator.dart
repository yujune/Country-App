import 'dart:io';

import 'package:country/abstracts/api_service.dart';
import 'package:country/abstracts/country_repository.dart';
import 'package:country/repositories/country_repository.dart';
import 'package:country/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  final dio = Dio(
    BaseOptions(
      headers: <String, String>{
        'Content-Type': ContentType.json.value,
      },
      //TODO: Move to environment files.
      baseUrl: 'https://restcountries.com/v3.1',
    ),
  );
  locator.registerSingleton<ApiService>(ApiServiceImpl(dio: dio));
  locator.registerSingleton<CountryRepository>(
    CountryRepositoryImpl(
      service: locator<ApiService>(),
    ),
  );
}
