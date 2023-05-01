import 'package:dio/dio.dart';

abstract class ApiService {
  Future<Response<T>> getCountryList<T>();
  Future<Response<T>> getCountry<T>({required String name});
}
