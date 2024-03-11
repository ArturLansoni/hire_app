import 'package:flutter/material.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/features/home/domain/entities/company_entity.dart';
import 'package:hire_app/features/home/domain/entities/service_entity.dart';
import 'package:hire_app/features/home/presentation/widgets/company_item.dart';

class AvailableCompaniesSection extends StatelessWidget {
  const AvailableCompaniesSection({
    required this.filter,
    required this.onTap,
    super.key,
  });

  final String filter;
  final void Function(CompanyEntity company) onTap;

  static const companies = [
    CompanyEntity(
      name: 'Vegas Repairs',
      category: 'ELECTRICIAN',
      location: 'Las Vegas, USA',
      rating: 4.9,
    ),
    CompanyEntity(
      name: 'John clean everything',
      category: 'JANITOR',
      location: 'São Paulo, BR',
      rating: 4,
    ),
    CompanyEntity(
      name: 'Food & Drinks',
      category: 'CHEF',
      location: 'Madrid, ES',
      rating: 4.2,
    ),
    CompanyEntity(
      name: 'Jay barber',
      category: 'BARBER',
      location: 'Campinas, BR',
      rating: 3.5,
      imageURL:
          'https://s3-media0.fl.yelpcdn.com/bphoto/MNF7bSEIra4DVDVT7lqp5w/348s.jpg',
    ),
    CompanyEntity(
      name: 'Dwight',
      category: 'OFFICE',
      location: 'Scranton, USA',
      rating: 4.8,
      imageURL: 'https://tm.ibxk.com.br/2023/07/11/11171223585362.jpg',
      services: [
        ServiceEntity(
          id: '1',
          name: 'Vigilancia noturna',
          initialRange: 100,
          finalRange: 200,
        ),
        ServiceEntity(
          id: '2',
          name: 'Controle de pragas',
          initialRange: 100,
          finalRange: 200,
        ),
      ],
    ),
  ];

  bool _filter(CompanyEntity element) =>
      element.name.trim().toLowerCase().contains(filter.trim().toLowerCase());

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.availableCompaniesSectionTitle,
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
              final company = companies.where(_filter).toList()[index];
              return CompanyItem(
                onTap: () => onTap(company),
                name: company.name,
                category: company.category,
                imageURL: company.imageURL,
                location: company.location,
                rating: company.rating,
              );
            },
            itemCount: companies.where(_filter).length,
          ),
        ),
      ],
    );
  }
}
