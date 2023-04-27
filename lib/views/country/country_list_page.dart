import 'package:country/models/country.dart';
import 'package:country/viewmodels/country_view_model.dart';
import 'package:country/widgets/country/country_list_item.dart';
import 'package:country/widgets/loading/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryListPage extends StatefulWidget {
  const CountryListPage({super.key});

  @override
  State<CountryListPage> createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  late CountryViewModel _viewModel;
  List<Country>? _countryList;
  bool _isLoading = true;

  void setIsLoading({bool loading = true}) => setState(
        () => _isLoading = loading,
      );

  Future<void> onRefresh() async {
    await _viewModel.getCountryList();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _viewModel = context.read<CountryViewModel>();
      setIsLoading();
      _countryList = await _viewModel.getCountryList();
      setIsLoading(loading: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const LoadingIndicator();

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(
          itemCount: _countryList?.length ?? 0,
          itemBuilder: (context, index) => CountryListItem(
              name: _countryList?[index].name?.common ?? '',
              flagImageUrl: _countryList?[index].flags?.png ?? ''),
        ),
      ),
    );
  }
}
