import 'package:country/viewmodels/country_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryListPage extends StatefulWidget {
  const CountryListPage({super.key});

  @override
  State<CountryListPage> createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  late CountryViewModel viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel = context.read<CountryViewModel>();
      viewModel.getCountryList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
