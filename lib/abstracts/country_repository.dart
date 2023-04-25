import 'package:country/models/country.dart';

abstract class CountryRepository {
  Future<List<Country>> getCountryList();
}
