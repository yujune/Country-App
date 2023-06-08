import 'package:country/models/country.dart';
import 'package:country/utils/extensions.dart';
import 'package:country/viewmodels/country_view_model.dart';
import 'package:country/widgets/common/info_item.dart';
import 'package:country/widgets/common/shadow_container.dart';
import 'package:country/widgets/loading/loading_indicator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CountryDetailsPage extends StatefulWidget {
  const CountryDetailsPage({super.key, required this.name});

  final String name;

  @override
  State<CountryDetailsPage> createState() => _CountryDetailsPageState();
}

class _CountryDetailsPageState extends State<CountryDetailsPage> {
  bool _isLoading = true;
  Country? _country;
  late CountryViewModel _viewModel;

  void setIsLoading({bool loading = true}) => setState(
        () => _isLoading = loading,
      );

  void setCountry(Country country) {
    setState(() => _country = country);
  }

  Future<void> onRefresh() async {
    await _viewModel.getCountry(name: widget.name);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _viewModel = context.read<CountryViewModel>();
      setIsLoading();
      try {
        final response = await _viewModel.getCountry(name: widget.name);
        if (response.isNotEmpty) {
          setCountry(response[0]);
        }
      } on DioError catch (error) {
        //TODO: Error handling.
        print(error);
      }

      setIsLoading(loading: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: context.pop,
        ),
      ),
      body: _isLoading
          ? const LoadingIndicator()
          : RefreshIndicator(
              onRefresh: onRefresh,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    children: [
                      if (_country?.coatOfArms?.png?.isNotEmpty ?? false)
                        Text(
                          'Coat of arms',
                          style: context.theme.textTheme.displayMedium,
                        ),
                      if (_country?.coatOfArms?.png?.isNotEmpty ?? false)
                        SizedBox(
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                                Image.network(_country?.coatOfArms?.png ?? ''),
                          ),
                        ),
                      ShadowContainer(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.all(0),
                          child: Image.network(_country?.flags?.png ?? '')),
                      ShadowContainer(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: InfoItem(
                                label: 'Name',
                                value: _country?.name?.official ?? '-',
                              ),
                            ),
                            Expanded(
                              child: InfoItem(
                                label: 'Capital',
                                value: _country?.capital?[0] ?? '-',
                              ),
                            ),
                            Expanded(
                              child: InfoItem(
                                label: 'Population',
                                value: _country?.population.toString() ?? '-',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
