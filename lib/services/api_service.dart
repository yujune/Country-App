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
}
