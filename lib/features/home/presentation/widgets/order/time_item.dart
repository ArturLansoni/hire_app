import 'package:flutter/material.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/widgets/widgets.dart';

class TimeItem extends StatelessWidget {
  const TimeItem({
    required this.top,
    required this.bottom,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String top;
  final String bottom;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: onTap,
      color: isSelected
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context)
              .colorScheme
              .primary
              .withOpacity(Tokens.opacity.ref40),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context)
                .colorScheme
                .primary
                .withOpacity(Tokens.opacity.ref40),
        borderRadius: BorderRadius.circular(
          Tokens.radius.normal,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Tokens.size.ref3,
        vertical: Tokens.size.ref2,
      ),
      child: Container(
        constraints: BoxConstraints(minWidth: Tokens.size.ref9),
        child: Column(
          children: [
            Text(
              top,
              style: TextStyle(
                color: Tokens.colors.background,
                fontSize: Tokens.fontSize.ref20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              bottom,
              style: TextStyle(
                color: Tokens.colors.background,
                fontSize: Tokens.fontSize.ref14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
