import 'package:country/views/country/country_details_page.dart';
import 'package:country/views/country/country_list_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CountryListPage(),
      routes: [
        GoRoute(
          path: 'details/:name',
          name: 'details',
          builder: (context, state) => CountryDetailsPage(
            name: state.pathParameters['name'] ?? '',
          ),
        ),
      ],
    ),
  ],
);
