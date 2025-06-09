import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_responsive_app/l10n/app_localizations.dart';
import 'package:news_responsive_app/src/modules/common/widgets/adaptive_grid.dart';
import 'package:news_responsive_app/src/modules/domains/presentation/providers/domains_provider.dart';
import 'package:news_responsive_app/src/modules/headlines/domain/models/article.dart';
import 'package:news_responsive_app/src/modules/headlines/presentation/widgets/article_card.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class DomainsPage extends ConsumerWidget {
  final String domain;

  const DomainsPage({super.key, required this.domain});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(domainsProvider(domain));
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      child: result.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) =>
            Center(child: Text(l10n.loadingError, textAlign: TextAlign.center)),
        data: (List<Article> articles) {
          return AdaptiveGrid(
            items: articles,
            itemBuilder: (_, i) => ArticleCard(article: articles[i]),
          );
        },
      ),
    );
  }
}
