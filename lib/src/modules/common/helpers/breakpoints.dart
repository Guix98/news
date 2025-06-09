enum ScreenSize { mobile, tablet, desktop }

ScreenSize getScreenSize(double width) {
  if (width >= 1024) return ScreenSize.desktop;
  if (width >= 600) return ScreenSize.tablet;
  return ScreenSize.mobile;
}

extension ScreenSizeExtension on ScreenSize {
  bool get isMobile => this == ScreenSize.mobile;
  bool get isTablet => this == ScreenSize.tablet;
  bool get isDesktop => this == ScreenSize.desktop;
}
