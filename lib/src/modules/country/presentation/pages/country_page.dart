import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_responsive_app/src/modules/country/presentation/providers/country_provider.dart';
import 'package:news_responsive_app/src/modules/headlines/domain/models/article.dart';
import 'package:news_responsive_app/src/modules/headlines/presentation/widgets/article_card.dart';

class CountryPage extends ConsumerWidget {
  final String countryCode;

  const CountryPage({super.key, required this.countryCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(countryProvider(countryCode));

    return Scaffold(
      appBar: AppBar(title: Text('Country: $countryCode')),
      body: result.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (List<Article> articles) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: articles.length,
            itemBuilder: (_, i) => ArticleCard(article: articles[i]),
          );
        },
      ),
    );
  }
}
