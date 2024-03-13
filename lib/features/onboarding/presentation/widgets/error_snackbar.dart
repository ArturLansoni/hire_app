import 'package:flutter/material.dart';
import 'package:hire_app/core/styles/tokens.dart';

class ErrorSnackBar extends SnackBar {
  ErrorSnackBar({
    required String message,
    super.key,
  }) : super(
          content: Row(
            children: [
              Icon(
                Icons.clear,
                color: Tokens.colors.error,
              ),
              SizedBox(width: Tokens.size.ref1),
              Expanded(
                child: Text(
                  message,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Tokens.radius.normal),
          ),
        );
}
