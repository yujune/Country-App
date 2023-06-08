import 'dart:async';
import 'package:country/models/country.dart';
import 'package:country/viewmodels/country_view_model.dart';
import 'package:country/widgets/common/search_bar.dart';
import 'package:country/widgets/country/country_list_item.dart';
import 'package:country/widgets/loading/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class CountryListPage extends StatefulWidget {
  const CountryListPage({super.key});

  @override
  State<CountryListPage> createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  late CountryViewModel _viewModel;
  List<Country>? _countryList;
  bool _isLoading = true;
  bool _isFiltering = false;
  Timer? _searchDebounce;
  TextEditingController searchEditingController = TextEditingController();

  void setIsLoading({bool loading = true}) => setState(
        () => _isLoading = loading,
      );

  void setIsFiltering({bool filtering = true}) => setState(
        () => _isFiltering = filtering,
      );

  Future<void> onRefresh() async {
    await _viewModel.getCountryList();
  }

  void onCountryTap(String name) {
    context.go('/details/$name');
  }

  Future<void> onSearchTextChanged(String text) async {
    if (_searchDebounce?.isActive ?? false) _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 500), () async {
      List<Country> filteredCountry = [];
      setIsFiltering();
      try {
        if (text.isEmpty) {
          filteredCountry = await _viewModel.getCountryList();
        } else {
          filteredCountry = await _viewModel.getCountry(name: text);
        }
      } catch (error) {
        filteredCountry = [];
      }
      setState(() {
        _countryList = filteredCountry;
      });
      setIsFiltering(filtering: false);
    });
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
  void dispose() {
    searchEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const LoadingIndicator();
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: Column(
            children: [
              SearchBar(
                margin: const EdgeInsets.all(10),
                controller: searchEditingController,
                onChanged: onSearchTextChanged,
                onClearText: () {
                  onSearchTextChanged('');
                },
              ),
              Expanded(
                child: _isFiltering
                    ? const LoadingIndicator()
                    : ListView.builder(
                        itemCount: _countryList?.length ?? 0,
                        itemBuilder: (context, index) => CountryListItem(
                          name: _countryList?[index].name?.common ?? '',
                          flagImageUrl: _countryList?[index].flags?.png ?? '',
                          onTap: onCountryTap,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
