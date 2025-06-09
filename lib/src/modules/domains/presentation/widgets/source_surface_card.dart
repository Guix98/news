import 'package:news_responsive_app/l10n/app_localizations.dart';
import 'package:news_responsive_app/src/modules/common/helpers/url_helper.dart';
import 'package:news_responsive_app/src/modules/common/widgets/description_text_row.dart';
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
        content: Column(
          children: [
            DescriptionTextRow(
              label: l10n.category,
              value: source.category?.toUpperCase() ?? 'N/A',
            ),
            DescriptionTextRow(
              label: l10n.country,
              value: source.country?.toUpperCase() ?? 'N/A',
            ),
            DescriptionTextRow(
              label: l10n.language,
              value: source.language?.toUpperCase() ?? 'N/A',
            ),
            SizedBox(height: 16),
            GhostButton(
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
