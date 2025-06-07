import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_responsive_app/src/core/config/dio_client.dart';
import 'package:news_responsive_app/src/modules/headlines/domain/models/article.dart';

class NewsApiService {
  NewsApiService();

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
}
