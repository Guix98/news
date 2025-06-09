import 'package:news_responsive_app/src/modules/common/services/news_repository.dart';
import 'package:news_responsive_app/src/modules/domains/data/models/source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sources_provider.g.dart';

@riverpod
Future<List<Source>> sources(SourcesRef ref) async {
  return await NewsRepository.fetchSources(country: 'us');
}
