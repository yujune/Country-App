import 'package:country/abstracts/api_service.dart';
import 'package:country/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('Api Service GET Request', () {
    final mockDio = MockDio();
    late DioError mockError;
    late ApiService apiService;

    setUp(() {
      final mockData = {
        "error": {
          "message": "Api request fail",
        },
      };
      mockError = DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          data: mockData,
        ),
      );
      apiService = ApiServiceImpl(dio: mockDio);
    });

    test('should get country list data successfully', () async {
      final mockData = {
        "name": {
          "common": "Barbados",
          "official": "Barbados",
        },
      };
      when(() => mockDio.get('/all')).thenAnswer(
        (realInvocation) => Future.value(
          Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 200,
            data: mockData,
          ),
        ),
      );

      final response = await apiService.getCountryList();

      expect(response.data, mockData);
    });

    test('should throw an error if getCountryList fail', () async {
      when(() => mockDio.get('/all')).thenThrow(mockError);

      //defer execution of the method until it is called by the expect statement.
      expect(() => apiService.getCountryList(), throwsA(mockError));
    });

    test('should get country data successfully', () async {
      final mockData = {
        "name": {
          "common": "Barbados",
          "official": "Barbados",
        },
      };
      when(() => mockDio.get('/name/Barbados')).thenAnswer(
        (realInvocation) => Future.value(
          Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 200,
            data: mockData,
          ),
        ),
      );
      final response = await apiService.getCountry(name: 'Barbados');

      expect(response.data, mockData);
    });

    test('should throw an error if getCountry fail', () async {
      when(() => mockDio.get('/name/Barbados')).thenThrow(mockError);

      expect(() => apiService.getCountry(name: 'Barbados'), throwsA(mockError));
    });
  });
}
