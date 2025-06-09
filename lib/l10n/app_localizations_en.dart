// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get headline => 'Headline News';

  @override
  String get loadingError => 'Error loading data';

  @override
  String get changeCountry => 'Change Country';

  @override
  String get country => 'Country';

  @override
  String get newsApiDisclaimerTitle => 'NewsAPI Disclaimer';

  @override
  String get newsApiDisclaimerDescription => 'NewsAPI currently only supports news from the United States (US). Other countries are not available.';

  @override
  String get moreInfo => 'More Info';

  @override
  String get category => 'Category';

  @override
  String get language => 'Language';

  @override
  String get search => 'Search';

  @override
  String get domain => 'Domain';

  @override
  String get sources => 'Sources';
}
