import 'package:go_router/go_router.dart';
import 'package:news_responsive_app/l10n/app_localizations.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class NavigationShell extends StatelessWidget {
  final Widget child;

  const NavigationShell({super.key, required this.child});

  String getPageTitle(String location, AppLocalizations l10n) {
    if (location.startsWith('/search')) return l10n.search;
    if (location.startsWith('/country')) return l10n.country;
    if (location.startsWith('/domains')) return l10n.domain;
    if (location.startsWith('/sources')) return l10n.sources;
    return l10n.headline;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final location = GoRouter.of(context).state.fullPath;
    final pageTitle = getPageTitle(location ?? '', l10n);

    return Scaffold(
      headers: [
        AppBar(
          header: Text(pageTitle),
          title: const Text('NewsApp'),
          subtitle: Text('Powered by NewsAPI'),
          leading: [
            OutlineButton(
              density: ButtonDensity.icon,
              onPressed: () => context.go('/'),
              child: const Icon(Icons.home),
            ),
          ],
          trailing: [
            OutlineButton(
              density: ButtonDensity.icon,
              onPressed: () => context.go('/search?q=flutter'),
              child: const Icon(Icons.search),
            ),
            OutlineButton(
              density: ButtonDensity.icon,
              onPressed: () => context.go('/country?code=us'),
              child: const Icon(Icons.flag),
            ),
            OutlineButton(
              density: ButtonDensity.icon,
              onPressed: () => context.go('/sources'),
              child: const Icon(Icons.language),
            ),
          ],
        ),
        Divider(),
      ],
      child: child,
    );
  }
}
