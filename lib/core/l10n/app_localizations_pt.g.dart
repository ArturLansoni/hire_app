import 'app_localizations.g.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Hire';

  @override
  String get homePageTitle => 'Início';

  @override
  String get searchSectionInput => 'Do que você precisa?';

  @override
  String get categoriesSectionTitle => 'Categorias';

  @override
  String get promotionsSectionTitle => 'Promoções';

  @override
  String get lastOrdersSectionTitle => 'Últimos pedidos';

  @override
  String get loginPageEmailLabel => 'Email';

  @override
  String get loginPagePasswordLabel => 'Senha';

  @override
  String get loginPageSignInButton => 'Entrar';

  @override
  String get loginPageCreateAccountButton => 'Não possui conta? Cadastre-se aqui';

  @override
  String get bottomSheetHomeTab => 'Início';

  @override
  String get bottomSheetUrgentTab => 'Urgente';

  @override
  String get bottomSheetScheduleTab => 'Agenda';

  @override
  String get bottomSheetChatTab => 'Chat';

  @override
  String get requiredField => 'Campo obrigatório';

  @override
  String get invalidEmail => 'Email inválido';
}
