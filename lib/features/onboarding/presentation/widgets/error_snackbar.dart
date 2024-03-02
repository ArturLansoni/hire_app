import 'package:flutter/material.dart';
import 'package:hire_app/core/styles/tokens.dart';

class ErrorSnackBar extends SnackBar {
  ErrorSnackBar({
    required String message,
    super.key,
  }) : super(
          content: Row(
            children: [
              const Icon(
                Icons.clear,
                color: Colors.red,
              ),
              Text(
                message,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Tokens.radius.normal),
          ),
        );
}
