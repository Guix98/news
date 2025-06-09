import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_responsive_app/l10n/app_localizations.dart';
import 'package:news_responsive_app/src/modules/common/widgets/adaptive_grid.dart';
import 'package:news_responsive_app/src/modules/headlines/domain/models/article.dart';
import 'package:news_responsive_app/src/modules/headlines/presentation/widgets/article_card.dart';
import 'package:news_responsive_app/src/modules/search/presentation/providers/search_provider.dart';

class SearchPage extends ConsumerStatefulWidget {
  final String initialQuery;

  const SearchPage({super.key, required this.initialQuery});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late final TextEditingController _controller;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _query = widget.initialQuery;
    _controller = TextEditingController(text: _query);
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(searchProvider(_query));
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Search news...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (value) {
                setState(() => _query = value.trim());
              },
            ),
          ),
          Expanded(
            child: result.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(
                child: Text(l10n.loadingError, textAlign: TextAlign.center),
              ),
              data: (List<Article> articles) {
                if (articles.isEmpty) {
                  return const Center(child: Text('No results'));
                }

                return AdaptiveGrid(
                  items: articles,
                  itemBuilder: (_, i) => ArticleCard(article: articles[i]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
