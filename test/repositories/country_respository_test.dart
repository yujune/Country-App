import 'package:country/abstracts/api_service.dart';
import 'package:country/abstracts/country_repository.dart';
import 'package:country/models/country.dart';
import 'package:country/repositories/country_repository.dart';
import 'package:country/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'country_respository_test.mocks.dart';

@GenerateMocks([ApiServiceImpl])
void main() {
  group('Country Repository', () {
    ApiService mockApiService = MockApiServiceImpl();
    late CountryRepository countryRepo;

    setUp(() {
      countryRepo = CountryRepositoryImpl(service: mockApiService);
    });

    test('getCountryList should return country list', () async {
      final mockResponse = Response(
        requestOptions: RequestOptions(),
        data: [
          {
            "name": {
              "common": "Barbados",
              "official": "Barbados",
            }
          },
        ],
      );
      when(mockApiService.getCountryList())
          .thenAnswer((realInvocation) => Future.value(mockResponse));

      final response = await countryRepo.getCountryList();

      expect(
        response,
        [
          Country(
            name: Name(common: 'Barbados', official: 'Barbados'),
          ),
        ],
      );
    });

    test('getCountry should return country', () async {
      final mockResponse = Response(
        requestOptions: RequestOptions(),
        data: [
          {
            "name": {
              "common": "Barbados",
              "official": "Barbados",
            }
          },
        ],
      );

      when(mockApiService.getCountry(name: 'Barbados'))
          .thenAnswer((realInvocation) => Future.value(mockResponse));

      final response = await countryRepo.getCountry(name: 'Barbados');

      expect(
        response,
        [
          Country(
            name: Name(common: 'Barbados', official: 'Barbados'),
          )
        ],
      );
    });
  });
}
