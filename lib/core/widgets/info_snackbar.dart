import 'package:flutter/material.dart';
import 'package:hire_app/core/styles/tokens.dart';

class InfoSnackBar extends SnackBar {
  InfoSnackBar({
    required String message,
    super.key,
  }) : super(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.info,
                color: Tokens.colors.background,
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
