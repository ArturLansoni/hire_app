import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.g.dart';
import 'app_localizations_pt.g.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.g.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Hire'**
  String get appTitle;

  /// No description provided for @homePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get homePageTitle;

  /// No description provided for @searchSectionInput.
  ///
  /// In en, this message translates to:
  /// **'What you need?'**
  String get searchSectionInput;

  /// No description provided for @categoriesSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categoriesSectionTitle;

  /// No description provided for @promotionsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Promotions'**
  String get promotionsSectionTitle;

  /// No description provided for @availableCompaniesSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Companies available right now'**
  String get availableCompaniesSectionTitle;

  /// No description provided for @loginPageEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginPageEmailLabel;

  /// No description provided for @loginPagePasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPagePasswordLabel;

  /// No description provided for @loginPageSignInButton.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginPageSignInButton;

  /// No description provided for @loginPageCreateAccountText.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get loginPageCreateAccountText;

  /// No description provided for @loginPageCreateAccountButton.
  ///
  /// In en, this message translates to:
  /// **'Register here'**
  String get loginPageCreateAccountButton;

  /// No description provided for @registerPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerPageTitle;

  /// No description provided for @registerPagePasswordConfirmationLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get registerPagePasswordConfirmationLabel;

  /// No description provided for @registerPageWelcomeFirstPart.
  ///
  /// In en, this message translates to:
  /// **'Welcome to '**
  String get registerPageWelcomeFirstPart;

  /// No description provided for @registerPageWelcomeLastPart.
  ///
  /// In en, this message translates to:
  /// **', create your user here'**
  String get registerPageWelcomeLastPart;

  /// No description provided for @registerPageSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerPageSubmitButton;

  /// No description provided for @registerPageLoginFirstPart.
  ///
  /// In en, this message translates to:
  /// **'Already have a user?'**
  String get registerPageLoginFirstPart;

  /// No description provided for @registerPageLoginLastPart.
  ///
  /// In en, this message translates to:
  /// **'Login here'**
  String get registerPageLoginLastPart;

  /// No description provided for @bottomNavHomeTab.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get bottomNavHomeTab;

  /// No description provided for @bottomNavUrgentTab.
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get bottomNavUrgentTab;

  /// No description provided for @bottomNavScheduleTab.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get bottomNavScheduleTab;

  /// No description provided for @bottomNavChatTab.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get bottomNavChatTab;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get requiredField;

  /// No description provided for @passwordDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordDoNotMatch;

  /// No description provided for @passwordStrengthLength.
  ///
  /// In en, this message translates to:
  /// **'The password must have more than 8 characters'**
  String get passwordStrengthLength;

  /// No description provided for @passwordStrengthLowercase.
  ///
  /// In en, this message translates to:
  /// **'The password must have lowercase letters'**
  String get passwordStrengthLowercase;

  /// No description provided for @passwordStrengthUppercase.
  ///
  /// In en, this message translates to:
  /// **'The password must have uppercase letters'**
  String get passwordStrengthUppercase;

  /// No description provided for @passwordStrengthNumbers.
  ///
  /// In en, this message translates to:
  /// **'The password must have numbers'**
  String get passwordStrengthNumbers;

  /// No description provided for @passwordStrengthSpecial.
  ///
  /// In en, this message translates to:
  /// **'The password must have special characters'**
  String get passwordStrengthSpecial;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmail;

  /// No description provided for @invalidCredentialsError.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get invalidCredentialsError;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Oops, something went wrong, try again later'**
  String get unknownError;

  /// No description provided for @splashPageWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get splashPageWelcome;

  /// No description provided for @unavailableFeature.
  ///
  /// In en, this message translates to:
  /// **'This feature will be available soon'**
  String get unavailableFeature;

  /// No description provided for @orderPageAvailableServices.
  ///
  /// In en, this message translates to:
  /// **'Available services'**
  String get orderPageAvailableServices;

  /// No description provided for @orderPageDescribe.
  ///
  /// In en, this message translates to:
  /// **'Describe what you need'**
  String get orderPageDescribe;

  /// No description provided for @orderPageSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get orderPageSubmitButton;

  /// No description provided for @timeSectionSelectDate.
  ///
  /// In en, this message translates to:
  /// **'Choose date'**
  String get timeSectionSelectDate;

  /// No description provided for @timeSectionSelectHour.
  ///
  /// In en, this message translates to:
  /// **'Choose the time'**
  String get timeSectionSelectHour;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sunday;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get saturday;

  /// No description provided for @schedulePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedulePageTitle;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
