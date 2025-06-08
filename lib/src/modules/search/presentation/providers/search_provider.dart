import 'package:news_responsive_app/src/modules/common/services/news_repository.dart';
import 'package:news_responsive_app/src/modules/headlines/domain/models/article.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@riverpod
Future<List<Article>> search(SearchRef ref, String query) async {
  if (query.isEmpty) return [];
  return await NewsRepository.fetchByQuery(query);
}
