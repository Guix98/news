import 'package:flutter/material.dart';
import 'package:news_responsive_app/src/core/extensions/context_extensions.dart';
import 'package:news_responsive_app/src/modules/common/helpers/breakpoints.dart';

class AdaptiveGrid extends StatelessWidget {
  final int? mobileCount;
  final int? tabletCount;
  final int? desktopCount;
  final double? mobileAspectRatio;
  final double? tabletAspectRatio;
  final double? desktopAspectRatio;
  final List items;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final EdgeInsetsGeometry padding;

  const AdaptiveGrid({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.mobileCount,
    this.tabletCount,
    this.desktopCount,
    this.mobileAspectRatio,
    this.tabletAspectRatio,
    this.desktopAspectRatio,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;

    final crossAxisCount = switch (screenSize) {
      ScreenSize.mobile => mobileCount ?? 1,
      ScreenSize.tablet => tabletCount ?? 3,
      ScreenSize.desktop => desktopCount ?? 4,
    };

    final aspectRatio = switch (screenSize) {
      ScreenSize.mobile => mobileAspectRatio ?? 2.8,
      ScreenSize.tablet => tabletAspectRatio ?? 1.2,
      ScreenSize.desktop => desktopAspectRatio ?? 1.2,
    };

    return GridView.builder(
      padding: padding,
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: aspectRatio,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
