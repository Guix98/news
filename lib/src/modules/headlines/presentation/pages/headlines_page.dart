import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_responsive_app/l10n/app_localizations.dart';
import 'package:news_responsive_app/src/modules/common/widgets/adaptive_grid.dart';
import 'package:news_responsive_app/src/modules/headlines/presentation/providers/headlines_provider.dart';
import 'package:news_responsive_app/src/modules/headlines/presentation/widgets/article_card.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class HeadlinesPage extends ConsumerWidget {
  const HeadlinesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesAsync = ref.watch(headlinesProvider);
    final l10n = AppLocalizations.of(context)!;

    return articlesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) =>
          Center(child: Text(l10n.loadingError, textAlign: TextAlign.center)),
      data: (articles) {
        return AdaptiveGrid(
          items: articles,
          itemBuilder: (_, i) => ArticleCard(article: articles[i]),
        );
      },
    );
  }
}
