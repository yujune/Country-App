import 'package:country/abstracts/country_repository.dart';
import 'package:country/utils/service_locator.dart';
import 'package:country/viewmodels/country_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerAssets() => [
      ChangeNotifierProvider(
        create: (_) {
          return CountryViewModel(
            countryRepo: locator<CountryRepository>(),
          );
        },
      ),
    ];
