import 'package:flutter/material.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/features/home/domain/entities/company_entity.dart';
import 'package:hire_app/features/home/presentation/widgets/company_item.dart';

class AvailableCompaniesSection extends StatelessWidget {
  const AvailableCompaniesSection({
    required this.filter,
    required this.onTap,
    super.key,
    this.companies,
    this.isLoading = false,
  });

  final String filter;
  final bool isLoading;
  final List<CompanyEntity>? companies;
  final void Function(CompanyEntity company) onTap;

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
        if (isLoading)
          Container(
            padding: EdgeInsets.symmetric(vertical: Tokens.size.ref3),
            child: Center(
              child: SizedBox(
                height: Tokens.size.ref6,
                width: Tokens.size.ref6,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
        if (!isLoading)
          SizedBox(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) =>
                  SizedBox(height: Tokens.size.ref2),
              itemBuilder: (context, index) {
                final company = companies?.where(_filter).toList()[index];
                if (company == null) return Container();
                return CompanyItem(
                  onTap: () => onTap(company),
                  name: company.name,
                  category: company.category,
                  imageURL: company.imageURL,
                  location: company.location,
                  rating: company.rating,
                );
              },
              itemCount: companies?.where(_filter).length ?? 0,
            ),
          ),
      ],
    );
  }
}
