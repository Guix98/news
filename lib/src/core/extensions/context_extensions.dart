import 'package:flutter/widgets.dart';
import 'package:news_responsive_app/src/modules/common/helpers/breakpoints.dart';

extension ScreenSizeContext on BuildContext {
  ScreenSize get screenSize {
    final width = MediaQuery.sizeOf(this).width;
    return getScreenSize(width);
  }

  bool get isMobile => screenSize == ScreenSize.mobile;
  bool get isTablet => screenSize == ScreenSize.tablet;
  bool get isDesktop => screenSize == ScreenSize.desktop;
}
