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

  @override
  String get loginPageEmailLabel => 'Email';

  @override
  String get loginPagePasswordLabel => 'Password';

  @override
  String get loginPageSignInButton => 'Sign in';

  @override
  String get loginPageCreateAccountButton => 'Don\'t have an account? Register here';

  @override
  String get bottomSheetHomeTab => 'Home';

  @override
  String get bottomSheetUrgentTab => 'Urgent';

  @override
  String get bottomSheetScheduleTab => 'Schedule';

  @override
  String get bottomSheetChatTab => 'Chat';

  @override
  String get requiredField => 'Required field';

  @override
  String get invalidEmail => 'Invalid email';
}
