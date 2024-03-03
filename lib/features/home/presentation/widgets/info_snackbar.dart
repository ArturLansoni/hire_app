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
              const Icon(
                Icons.info,
                color: Colors.black,
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
