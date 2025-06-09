import 'package:news_responsive_app/l10n/app_localizations.dart';
import 'package:news_responsive_app/src/modules/common/helpers/url_helper.dart';
import 'package:news_responsive_app/src/modules/domains/data/models/source.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class SourceSurfaceCard extends StatelessWidget {
  const SourceSurfaceCard({super.key, required this.source});

  final Source source;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SurfaceCard(
      child: Basic(
        title: Text(source.name ?? ''),
        content: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.category,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ).p,
                Text(source.category?.toUpperCase() ?? 'N/A').p,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.country,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ).p,
                Text(source.country?.toUpperCase() ?? 'N/A').p,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.language,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ).p,
                Text(source.language?.toUpperCase() ?? 'N/A').p,
              ],
            ),
            TextButton(
              onPressed: () {
                tryLaunchURL(source.url ?? '');
              },
              child: const Text('Visit'),
            ),
          ],
        ),
      ),
    );
  }
}
