import 'package:go_router/go_router.dart';
import 'package:news_responsive_app/src/modules/common/widgets/navigation_shell.dart';
import 'package:news_responsive_app/src/modules/country/presentation/pages/country_page.dart';
import 'package:news_responsive_app/src/modules/domains/presentation/pages/domains_page.dart';
import 'package:news_responsive_app/src/modules/domains/presentation/pages/sources_page.dart';
import 'package:news_responsive_app/src/modules/headlines/presentation/pages/headlines_page.dart';
import 'package:news_responsive_app/src/modules/search/presentation/pages/search_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => NavigationShell(child: child),
      routes: [
        GoRoute(path: '/', builder: (_, __) => const HeadlinesPage()),
        GoRoute(
          path: '/search',
          builder: (_, state) {
            final query = state.uri.queryParameters['q'] ?? '';
            return SearchPage(initialQuery: query);
          },
        ),
        GoRoute(
          path: '/country',
          builder: (_, state) {
            final code = state.uri.queryParameters['code'] ?? 'us';
            return CountryPage(countryCode: code);
          },
        ),
        GoRoute(
          path: '/domains',
          builder: (_, state) {
            final domain = state.uri.queryParameters['domain'] ?? 'bbc.co.uk';
            return DomainsPage(domain: domain);
          },
        ),
        GoRoute(path: '/sources', builder: (_, __) => const SourcesPage()),
      ],
    ),
  ],
);
