import 'package:dio/dio.dart';

abstract class ApiService {
  Future<Response<T>> getCountryList<T>();
}
