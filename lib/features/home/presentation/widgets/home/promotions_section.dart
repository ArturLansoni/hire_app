import 'package:flutter/material.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/widgets/widgets.dart';

class PromotionsSection extends StatelessWidget {
  const PromotionsSection({
    required this.onTap,
    super.key,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.promotionsSectionTitle,
          style: TextStyle(fontSize: Tokens.fontSize.ref16),
        ),
        SizedBox(height: Tokens.size.ref2),
        Clickable(
          onTap: onTap,
          decoration: BoxDecoration(
            color: Tokens.colors.primary,
            borderRadius:
                BorderRadius.all(Radius.circular(Tokens.radius.normal)),
          ),
          padding: EdgeInsets.symmetric(
            vertical: Tokens.size.ref4,
            horizontal: Tokens.size.ref3,
          ),
          child: SizedBox(
            height: Tokens.size.ref30,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '10% OFF',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Tokens.fontSize.ref20,
                    color: Tokens.colors.background,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
