import 'package:go_router/go_router.dart';
import 'package:news_responsive_app/src/modules/headlines/presentation/pages/headlines_page.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HeadlinesPage()),
  ],
);
