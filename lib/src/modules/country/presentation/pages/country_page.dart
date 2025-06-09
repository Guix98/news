import 'package:country_code/country_code.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_responsive_app/l10n/app_localizations.dart';
import 'package:news_responsive_app/src/modules/common/helpers/url_helper.dart';
import 'package:news_responsive_app/src/modules/common/widgets/adaptive_grid.dart';
import 'package:news_responsive_app/src/modules/country/data/models/country_data.dart';
import 'package:news_responsive_app/src/modules/country/presentation/providers/country_provider.dart';
import 'package:news_responsive_app/src/modules/headlines/domain/models/article.dart';
import 'package:news_responsive_app/src/modules/headlines/presentation/widgets/article_card.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:shadcn_flutter/shadcn_flutter_extension.dart';

class CountryPage extends ConsumerWidget {
  final String countryCode;

  const CountryPage({super.key, required this.countryCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(countryProvider(countryCode));
    final l10n = AppLocalizations.of(context)!;
    var countryList = CountryCode.values
        .map<CountryData>(
          (country) => CountryData(flag: country.symbol, name: country.alpha3),
        )
        .toList();

    return Scaffold(
      headers: [
        AppBar(
          title: Text(
            '${l10n.country}: ${CountryCode.ofAlpha(countryCode.toUpperCase()).alpha3}',
          ).h1,
          trailing: [
            PrimaryButton(
              child: Text(l10n.changeCountry),
              onPressed: () async {
                final value = await showItemPicker<String>(
                  context,
                  items: ItemBuilder(
                    itemCount: countryList.length,
                    itemBuilder: (index) {
                      return countryList[index].flag;
                    },
                  ),
                  builder: (context, item) {
                    return Tooltip(
                      tooltip: (context) => TooltipContainer(
                        child: Text(
                          countryList
                              .firstWhere((country) => country.flag == item)
                              .name,
                        ),
                      ),
                      child: ItemPickerOption(
                        value: item,
                        child: Text(item.toString()).large,
                      ),
                    );
                  },
                );
                if (context.mounted && value != null) {
                  context.go(
                    '/country?code=${countryList.firstWhere((country) => country.flag == value).name}',
                  );
                }
              },
            ),
          ],
        ),
      ],
      child: result.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) =>
            Center(child: Text(l10n.loadingError, textAlign: TextAlign.center)),
        data: (List<Article> articles) {
          if (articles.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(48.0),
              child: Card(
                filled: true,
                borderColor: context.theme.colorScheme.primary,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.newsApiDisclaimerTitle).h2,
                    const SizedBox(height: 16),
                    Text(l10n.newsApiDisclaimerDescription).large,
                    const SizedBox(height: 16),
                    CodeSnippet(code: "Possible options: us", mode: 'json'),
                    const SizedBox(height: 16),
                    TextButton(
                      child: Text(l10n.moreInfo),
                      onPressed: () {
                        tryLaunchURL(
                          'https://newsapi.org/docs/endpoints/top-headlines',
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return AdaptiveGrid(
            items: articles,
            itemBuilder: (_, i) => ArticleCard(article: articles[i]),
          );
        },
      ),
    );
  }
}
