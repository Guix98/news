import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_responsive_app/l10n/app_localizations.dart';
import 'package:news_responsive_app/src/core/router/router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadcnApp.router(
      theme: ThemeData(colorScheme: ColorSchemes.darkSlate(), radius: 0.5),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
