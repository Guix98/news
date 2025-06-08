import 'package:news_responsive_app/src/modules/common/services/news_repository.dart';
import 'package:news_responsive_app/src/modules/headlines/domain/models/article.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'domains_provider.g.dart';

@riverpod
Future<List<Article>> domains(DomainsRef ref, String domain) async {
  return await NewsRepository.fetchByDomain(domain);
}
