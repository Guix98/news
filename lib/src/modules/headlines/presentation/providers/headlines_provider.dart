import 'package:news_responsive_app/src/modules/common/services/news_api_service.dart';
import 'package:news_responsive_app/src/modules/headlines/domain/models/article.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'headlines_provider.g.dart';

@riverpod
Future<List<Article>> headlines(HeadlinesRef ref) async {
  final headlinesList = await NewsApiService.fetchTopHeadlines();
  return headlinesList;
}
