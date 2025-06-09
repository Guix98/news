import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_responsive_app/src/modules/domains/data/models/source.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
abstract class Article with _$Article {
  const factory Article({
    required Source source,
    String? author,
    required String title,
    String? description,
    required String url,
    String? urlToImage,
    required DateTime publishedAt,
    String? content,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
