import 'app_localizations.g.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Hire';

  @override
  String get homePageTitle => 'Home';

  @override
  String get searchSectionInput => 'What you need?';

  @override
  String get categoriesSectionTitle => 'Categories';

  @override
  String get promotionsSectionTitle => 'Promotions';

  @override
  String get lastOrdersSectionTitle => 'Last orders';
}
