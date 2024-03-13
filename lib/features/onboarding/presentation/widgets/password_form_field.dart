import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    required this.label,
    required this.controller,
    super.key,
    this.onChanged,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  final String label;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final void Function(String value)? onFieldSubmitted;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool passwordVisible = false;

  void togglePasswordVisibility() =>
      setState(() => passwordVisible = !passwordVisible);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !passwordVisible,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: TextInputType.visiblePassword,
      obscuringCharacter: '*',
      autofillHints: const [AutofillHints.password],
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.label,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: togglePasswordVisibility,
        ),
      ),
    );
  }
}
