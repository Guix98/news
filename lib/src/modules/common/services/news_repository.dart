import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_responsive_app/src/core/config/dio_client.dart';
import 'package:news_responsive_app/src/modules/domains/data/models/source.dart';
import 'package:news_responsive_app/src/modules/headlines/domain/models/article.dart';

class NewsRepository {
  NewsRepository();

  static Future<List<Article>> fetchTopHeadlines({
    String country = 'us',
  }) async {
    final response = await DioClient.get(
      '/top-headlines',
      queryParameters: {
        'country': country,
        'apiKey': dotenv.env['NEWS_API_KEY'],
      },
    );

    final articles = (response.data['articles'] as List)
        .map((json) => Article.fromJson(json))
        .toList();

    return articles;
  }

  static Future<List<Article>> fetchByQuery(String query) async {
    final response = await DioClient.get(
      '/everything',
      queryParameters: {'q': query, 'apiKey': dotenv.env['NEWS_API_KEY']},
    );

    final List data = response.data['articles'] ?? [];
    return data.map((json) => Article.fromJson(json)).toList();
  }

  static Future<List<Article>> fetchByCountry(String countryCode) async {
    final response = await DioClient.get(
      '/top-headlines',
      queryParameters: {
        'country': countryCode,
        'apiKey': dotenv.env['NEWS_API_KEY'],
      },
    );

    final List data = response.data['articles'] ?? [];
    return data.map((json) => Article.fromJson(json)).toList();
  }

  static Future<List<Article>> fetchByDomain(String domain) async {
    final response = await DioClient.get(
      '/everything',
      queryParameters: {
        'domains': domain,
        'apiKey': dotenv.env['NEWS_API_KEY'],
      },
    );

    final List data = response.data['articles'] ?? [];
    return data.map((json) => Article.fromJson(json)).toList();
  }

  static Future<List<Source>> fetchSources({
    String? category,
    String? language,
    String? country,
  }) async {
    final response = await DioClient.get(
      '/top-headlines/sources',
      queryParameters: {
        if (category != null) 'category': category,
        if (language != null) 'language': language,
        if (country != null) 'country': country,
        'apiKey': dotenv.env['NEWS_API_KEY'],
      },
    );

    final List data = response.data['sources'] ?? [];
    return data.map((json) => Source.fromJson(json)).toList();
  }
}
