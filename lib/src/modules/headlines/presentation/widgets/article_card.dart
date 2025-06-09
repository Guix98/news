import 'package:news_responsive_app/src/modules/headlines/domain/models/article.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (article.urlToImage != null)
              Flexible(
                flex: 5,
                child: Image.network(
                  article.urlToImage!,

                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                ),
              ),
            Flexible(
              flex: 3,
              child: Text(
                article.title,
                maxLines: 100,
                overflow: TextOverflow.ellipsis,
              ).large,
            ),
          ],
        ),
      ),
    );
  }
}
