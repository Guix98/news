import 'package:go_router/go_router.dart';
import 'package:news_responsive_app/l10n/app_localizations.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class NavigationShell extends StatelessWidget {
  final Widget child;

  const NavigationShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      headers: [
        AppBar(
          header: Text(l10n.headline),
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
              onPressed: () => context.go('/domains?domain=bbc.co.uk'),
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
