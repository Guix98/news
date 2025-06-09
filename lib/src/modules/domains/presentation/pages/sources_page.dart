import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_responsive_app/l10n/app_localizations.dart';
import 'package:news_responsive_app/src/modules/common/helpers/url_helper.dart';
import 'package:news_responsive_app/src/modules/domains/data/models/source.dart';
import 'package:news_responsive_app/src/modules/domains/presentation/providers/sources_provider.dart';
import 'package:news_responsive_app/src/modules/domains/presentation/widgets/source_surface_card.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class SourcesPage extends ConsumerWidget {
  const SourcesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sourcesAsync = ref.watch(sourcesProvider);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      child: sourcesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) =>
            Center(child: Text(l10n.loadingError, textAlign: TextAlign.center)),
        data: (List<Source> sources) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ListView.builder(
                  shrinkWrap: true,

                  itemCount: sources.length,
                  itemBuilder: (context, index) {
                    final source = sources[index];
                    final domain = extractDomain(source.url ?? '');
                    return GestureDetector(
                      onTap: () => context.go('/domains?domain=$domain'),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HoverCard(
                            hoverBuilder: (context) {
                              return SourceSurfaceCard(source: source);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(source.name ?? '').h3,
                                  Flexible(
                                    child: Text(
                                      source.description ??
                                          'No description available',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ).p,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
