import 'package:go_router/go_router.dart';
import 'package:news_responsive_app/src/modules/country/presentation/pages/country_page.dart';
import 'package:news_responsive_app/src/modules/domains/presentation/pages/domains_page.dart';
import 'package:news_responsive_app/src/modules/headlines/presentation/pages/headlines_page.dart';
import 'package:news_responsive_app/src/modules/search/presentation/pages/search_page.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HeadlinesPage()),
    GoRoute(
      path: '/search',
      builder: (context, state) {
        final query = state.uri.queryParameters['q'] ?? '';
        return SearchPage(initialQuery: query);
      },
    ),
    GoRoute(
      path: '/country',
      builder: (context, state) {
        final code = state.uri.queryParameters['code'] ?? 'us';
        return CountryPage(countryCode: code);
      },
    ),
    GoRoute(
      path: '/domains',
      builder: (context, state) {
        final domain = state.uri.queryParameters['domain'] ?? 'bbc.co.uk';
        return DomainsPage(domain: domain);
      },
    ),
  ],
);
