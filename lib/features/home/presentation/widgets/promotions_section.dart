import 'package:flutter/material.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';

class PromotionsSection extends StatelessWidget {
  const PromotionsSection({super.key});

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
        Container(
          height: Tokens.size.ref30,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius:
                BorderRadius.all(Radius.circular(Tokens.radius.normal)),
          ),
          padding: EdgeInsets.symmetric(
            vertical: Tokens.size.ref4,
            horizontal: Tokens.size.ref3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '10% OFF',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Tokens.fontSize.ref20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
