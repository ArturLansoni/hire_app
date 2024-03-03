import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/utils/common_failures.dart';
import 'package:hire_app/core/utils/extensions/string_extension.dart';
import 'package:hire_app/core/utils/routes.dart';
import 'package:hire_app/features/onboarding/domain/cubits/auth_cubit.dart';
import 'package:hire_app/features/onboarding/presentation/widgets/button.dart';
import 'package:hire_app/features/onboarding/presentation/widgets/error_snackbar.dart';
import 'package:hire_app/features/onboarding/presentation/widgets/password_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().onLoad();
  }

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

  Future<void> _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      await context.read<AuthCubit>().signIn(
            _emailController.text,
            _passwordController.text,
          );
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        ErrorSnackBar(message: message),
      );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isSuccess) {
          TextInput.finishAutofillContext();
          Navigator.of(context).popAndPushNamed(Routes.home);
        }
        if (state.isError) {
          if (state.error case InvalidParams()) {
            return _showSnackbar(l10n.invalidCredentialsError);
          }
          _showSnackbar(l10n.unknownError);
        }
      },
      builder: (context, state) => Scaffold(
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
                        isLoading: state.isLoading,
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
