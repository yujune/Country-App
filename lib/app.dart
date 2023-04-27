import 'package:country/utils/theme.dart';
import 'package:country/views/country/country_list_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.defaultTheme,
      home: const CountryListPage(),
    );
  }
}
