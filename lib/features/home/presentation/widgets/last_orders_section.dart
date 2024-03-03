import 'package:flutter/material.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/features/home/domain/entities/service_entity.dart';
import 'package:hire_app/features/home/presentation/widgets/service_item.dart';

class LastOrdersSection extends StatelessWidget {
  const LastOrdersSection({
    required this.filter,
    required this.onTap,
    super.key,
  });

  final String filter;
  final void Function(ServiceEntity service) onTap;

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
    ServiceEntity(
      name: 'Jay barber',
      category: 'BARBER',
      location: 'Campinas',
      rating: 3.5,
    ),
    ServiceEntity(
      name: 'Dwight',
      category: 'OFFICE',
      location: 'Scranton',
      rating: 4.8,
    ),
  ];

  bool _filter(ServiceEntity element) =>
      element.name.trim().toLowerCase().contains(filter.trim().toLowerCase());

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
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) =>
                SizedBox(height: Tokens.size.ref2),
            itemBuilder: (context, index) {
              final service = services.where(_filter).toList()[index];
              return ServiceItem(
                onTap: () => onTap(service),
                name: service.name,
                category: service.category,
                imageURL: service.imageURL,
                location: service.location,
                rating: service.rating,
              );
            },
            itemCount: services.where(_filter).length,
          ),
        ),
      ],
    );
  }
}
