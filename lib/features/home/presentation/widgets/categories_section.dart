import 'package:flutter/material.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/features/home/presentation/widgets/category_item.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    required this.onTap,
    super.key,
  });

  final void Function() onTap;

  static const categories = [
    Category(title: 'Electrician', icon: Icons.electric_bolt),
    Category(title: 'Janitor', icon: Icons.cleaning_services),
    Category(title: 'Chef', icon: Icons.outdoor_grill),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.categoriesSectionTitle,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CategoryItem(
              text: categories[index].title,
              icon: categories[index].icon,
              onTap: onTap,
            ),
            itemCount: categories.length,
          ),
        ),
      ],
    );
  }
}

class Category {
  const Category({required this.title, required this.icon});

  final String title;
  final IconData icon;
}
