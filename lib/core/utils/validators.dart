import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/utils/extensions/string_extension.dart';

class Validators {
  static String? email(
    String? value, {
    required AppLocalizations l10n,
  }) {
    if (value?.isEmpty ?? true) {
      return l10n.requiredField;
    }
    if (!value!.isValidEmail()) {
      return l10n.invalidEmail;
    }
    return null;
  }

  static String? password(
    String? value, {
    required AppLocalizations l10n,
  }) {
    if (value?.isEmpty ?? true) {
      return l10n.requiredField;
    }
    final errorMessage = _checkPasswordStrength(value!, l10n: l10n);
    if (errorMessage?.isNotEmpty ?? false) return errorMessage;

    return null;
  }

  static String? passwordConfirmation(
    String? value, {
    required AppLocalizations l10n,
    required String passwordValue,
  }) {
    if (value?.isEmpty ?? true) {
      return l10n.requiredField;
    }

    if (value != passwordValue) {
      return l10n.passwordDoNotMatch;
    }
    return null;
  }

  static String? _checkPasswordStrength(
    String password, {
    required AppLocalizations l10n,
  }) {
    final rules = [
      RuleMessage(
        rule: RegExp('.{8,}'),
        message: l10n.passwordStrengthLength,
      ),
      RuleMessage(
        rule: RegExp('[a-z]'),
        message: l10n.passwordStrengthLowercase,
      ),
      RuleMessage(
        rule: RegExp('[A-Z]'),
        message: l10n.passwordStrengthUppercase,
      ),
      RuleMessage(
        rule: RegExp('[0-9]'),
        message: l10n.passwordStrengthNumbers,
      ),
      RuleMessage(
        rule: RegExp(r'[^a-zA-Z\d]'),
        message: l10n.passwordStrengthSpecial,
      ),
    ];

    for (var i = 0; i < rules.length; i++) {
      if (!rules[i].rule.hasMatch(password)) {
        return rules[i].message;
      }
    }
    return null;
  }
}

class RuleMessage {
  RuleMessage({required this.rule, required this.message});

  final RegExp rule;
  final String message;
}
