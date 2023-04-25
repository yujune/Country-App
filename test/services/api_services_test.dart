import 'package:country/abstracts/api_service.dart';
import 'package:country/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_services_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('Api Service GET Request', () {
    MockDio mockDio = MockDio();
    late ApiService apiService;

    setUp(() {
      apiService = ApiServiceImpl(dio: mockDio);
    });

    test('should get country list data successfully', () async {
      final mockData = {
        "name": {
          "common": "Barbados",
          "official": "Barbados",
        },
      };
      when(mockDio.get('/all')).thenAnswer(
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
      final mockData = {
        "error": {
          "message": "Api request fail",
        },
      };
      final error = DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          data: mockData,
        ),
      );
      when(mockDio.get('/all')).thenThrow(error);

      //defer execution of the method until it is called by the expect statement.
      expect(() => apiService.getCountryList(), throwsA(error));
    });
  });
}
