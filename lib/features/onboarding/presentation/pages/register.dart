import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/utils/routes.dart';
import 'package:hire_app/core/utils/validators.dart';
import 'package:hire_app/core/widgets/widgets.dart';
import 'package:hire_app/features/onboarding/domain/cubits/auth_cubit.dart';
import 'package:hire_app/features/onboarding/presentation/widgets/password_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  Future<void> _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      await context.read<AuthCubit>().register(
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
          _showSnackbar(l10n.unknownError);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.registerPageTitle),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(Tokens.size.ref3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Tokens.size.ref8),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: l10n.registerPageWelcomeFirstPart,
                        style: TextStyle(
                          fontSize: Tokens.fontSize.ref20,
                        ),
                        children: [
                          TextSpan(
                            text: l10n.appTitle,
                            style: TextStyle(
                              fontSize: Tokens.fontSize.ref28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: l10n.registerPageWelcomeLastPart),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Tokens.size.ref6),
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
                          validator: (value) =>
                              Validators.email(value, l10n: l10n),
                        ),
                        SizedBox(height: Tokens.size.ref3),
                        PasswordFormField(
                          label: l10n.loginPagePasswordLabel,
                          controller: _passwordController,
                          validator: (value) =>
                              Validators.password(value, l10n: l10n),
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: Tokens.size.ref3),
                        PasswordFormField(
                          label: l10n.registerPagePasswordConfirmationLabel,
                          controller: _passwordConfirmationController,
                          validator: (value) => Validators.passwordConfirmation(
                            value,
                            l10n: l10n,
                            passwordValue: _passwordController.text,
                          ),
                          onFieldSubmitted: (_) => _onSubmit(),
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(height: Tokens.size.ref6),
                        Button(
                          isLoading: state.isLoading,
                          onPressed: _onSubmit,
                          label: l10n.registerPageSubmitButton,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        l10n.registerPageLoginFirstPart,
                        style: TextStyle(
                          fontSize: Tokens.fontSize.ref16,
                        ),
                      ),
                      SizedBox(height: Tokens.size.ref1),
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Text(
                          l10n.registerPageLoginLastPart,
                          style: TextStyle(
                            fontSize: Tokens.fontSize.ref16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }
}
