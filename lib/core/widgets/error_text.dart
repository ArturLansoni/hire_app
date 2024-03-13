import 'package:flutter/material.dart';
import 'package:hire_app/core/styles/tokens.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: Tokens.size.ref1, left: Tokens.size.ref3),
          child: Text(
            text,
            style: TextStyle(
              color: Tokens.colors.error,
              fontSize: Tokens.fontSize.ref12,
            ),
          ),
        ),
      ],
    );
  }
}
