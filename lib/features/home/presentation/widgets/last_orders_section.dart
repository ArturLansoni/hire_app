import 'package:flutter/material.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/features/home/presentation/widgets/service_item.dart';

class LastOrdersSection extends StatelessWidget {
  const LastOrdersSection({super.key});

  static const services = [
    Service(
      name: 'Vegas Repairs',
      category: 'ELECTRICIAN',
      location: 'Las Vegas',
      rating: 4.9,
    ),
    Service(
      name: 'John clean everything',
      category: 'JANITOR',
      location: 'São Paulo',
      rating: 4,
    ),
    Service(
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
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        SizedBox(
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
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

class Service {
  const Service({
    required this.name,
    required this.location,
    required this.category,
    required this.rating,
    this.imageURL,
  });

  final String name;
  final String location;
  final String category;
  final double rating;
  final String? imageURL;
}
