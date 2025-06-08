// lib/src/modules/country/data/providers/country_provider.dart
import 'package:news_responsive_app/src/modules/common/services/news_repository.dart';
import 'package:news_responsive_app/src/modules/headlines/domain/models/article.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'country_provider.g.dart';

@riverpod
Future<List<Article>> country(CountryRef ref, String code) async {
  return await NewsRepository.fetchByCountry(code);
}
