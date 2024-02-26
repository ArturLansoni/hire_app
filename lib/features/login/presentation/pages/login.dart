import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/utils/extensions/string_extension.dart';
import 'package:hire_app/core/utils/routes.dart';
import 'package:hire_app/features/login/presentation/widgets/button.dart';
import 'package:hire_app/features/login/presentation/widgets/password_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _emailValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return AppLocalizations.of(context)!.requiredField;
    }
    if (!value!.isValidEmail()) {
      return AppLocalizations.of(context)!.invalidEmail;
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return AppLocalizations.of(context)!.requiredField;
    }
    return null;
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      TextInput.finishAutofillContext();
      Navigator.of(context).pushNamed(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Tokens.size.ref3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                l10n.appTitle,
                style: TextStyle(
                  fontSize: Tokens.fontSize.ref64,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: l10n.loginPageEmailLabel,
                      ),
                      validator: _emailValidator,
                    ),
                    SizedBox(height: Tokens.size.ref3),
                    PasswordFormField(
                      label: l10n.loginPagePasswordLabel,
                      controller: _passwordController,
                      validator: _passwordValidator,
                      onFieldSubmitted: (_) => _onSubmit(),
                      textInputAction: TextInputAction.done,
                    ),
                    SizedBox(height: Tokens.size.ref6),
                    Button(
                      onPressed: _onSubmit,
                      label: l10n.loginPageSignInButton,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  l10n.loginPageCreateAccountButton,
                  style: TextStyle(
                    fontSize: Tokens.fontSize.ref16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
