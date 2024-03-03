import 'app_localizations.g.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Hire';

  @override
  String get homePageTitle => 'Serviços';

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
  String get bottomNavHomeTab => 'Serviços';

  @override
  String get bottomNavUrgentTab => 'Urgente';

  @override
  String get bottomNavScheduleTab => 'Agenda';

  @override
  String get bottomNavChatTab => 'Chat';

  @override
  String get requiredField => 'Campo obrigatório';

  @override
  String get invalidEmail => 'Email inválido';

  @override
  String get invalidCredentialsError => 'E-mail ou senha inválidos';

  @override
  String get unknownError => 'Opa, algo deu errado, tente novamente mais tarde';

  @override
  String get splashPageWelcome => 'Seja bem vindo!';

  @override
  String get unavailableFeature => 'Esse recurso estará disponível em breve';
}
