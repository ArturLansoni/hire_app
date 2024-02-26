import 'package:flutter/material.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/features/home/domain/entities/service_entity.dart';
import 'package:hire_app/features/home/presentation/widgets/service_item.dart';

class LastOrdersSection extends StatelessWidget {
  const LastOrdersSection({super.key});

  static const services = [
    ServiceEntity(
      name: 'Vegas Repairs',
      category: 'ELECTRICIAN',
      location: 'Las Vegas',
      rating: 4.9,
    ),
    ServiceEntity(
      name: 'John clean everything',
      category: 'JANITOR',
      location: 'São Paulo',
      rating: 4,
    ),
    ServiceEntity(
      name: 'Food & Drinks',
      category: 'CHEF',
      location: 'Madrid',
      rating: 4.2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.lastOrdersSectionTitle,
          style: TextStyle(fontSize: Tokens.fontSize.ref16),
        ),
        SizedBox(height: Tokens.size.ref2),
        SizedBox(
          height: Tokens.size.ref60,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) =>
                SizedBox(height: Tokens.size.ref2),
            itemBuilder: (context, index) => ServiceItem(
              name: services[index].name,
              category: services[index].category,
              imageURL: services[index].imageURL,
              location: services[index].location,
              rating: services[index].rating,
            ),
            itemCount: services.length,
          ),
        ),
      ],
    );
  }
}
