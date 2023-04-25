import 'package:country/app.dart';
import 'package:country/utils/provider_assets.dart';
import 'package:country/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(providers: providerAssets(), child: const MyApp()));
}
