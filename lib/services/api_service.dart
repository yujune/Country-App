import 'package:country/abstracts/api_service.dart';
import 'package:dio/dio.dart';

class ApiServiceImpl implements ApiService {
  ApiServiceImpl({required Dio dio}) {
    _dio = dio;
  }

  late Dio _dio;

  @override
  Future<Response<T>> getCountryList<T>() {
    return _dio.get('/all');
  }

  @override
  Future<Response<T>> getCountry<T>({required String name}) {
    return _dio.get('/name/$name');
  }
}
