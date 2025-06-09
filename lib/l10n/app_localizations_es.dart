// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get headline => 'Noticias Principales';

  @override
  String get loadingError => 'Error al cargar los datos';

  @override
  String get changeCountry => 'Cambiar País';

  @override
  String get country => 'País';

  @override
  String get newsApiDisclaimerTitle => 'Aviso de NewsAPI';

  @override
  String get newsApiDisclaimerDescription => 'NewsAPI actualmente solo admite noticias de los Estados Unidos (US). Otros países no están disponibles.';

  @override
  String get moreInfo => 'Más Información';

  @override
  String get category => 'Categoría';

  @override
  String get language => 'Idioma';

  @override
  String get search => 'Buscar';

  @override
  String get domain => 'Dominio';

  @override
  String get sources => 'Fuentes';
}
