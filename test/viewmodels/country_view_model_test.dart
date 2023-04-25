import 'package:country/abstracts/country_repository.dart';
import 'package:country/models/country.dart';
import 'package:country/repositories/country_repository.dart';
import 'package:country/viewmodels/country_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'country_view_model_test.mocks.dart';

@GenerateMocks([CountryRepositoryImpl])
void main() {
  CountryRepository countryRepository = MockCountryRepositoryImpl();
  late CountryViewModel countryViewModel;
  group('CountryViewModel', () {
    setUp(() {
      countryViewModel = CountryViewModel(countryRepo: countryRepository);
    });
    test('getCountryList should return country list', () async {
      final countryList = [Country(name: Name(common: 'Malaysia'))];
      when(countryRepository.getCountryList())
          .thenAnswer((realInvocation) => Future.value(countryList));
      final response = await countryViewModel.getCountryList();
      expect(response, countryList);
    });
  });
}
