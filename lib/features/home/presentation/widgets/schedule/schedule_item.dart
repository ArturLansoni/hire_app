import 'package:flutter/material.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/utils/extensions/date_extension.dart';
import 'package:hire_app/core/widgets/widgets.dart';
import 'package:hire_app/features/home/domain/entities/service_entity.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({
    required this.date,
    required this.showDate,
    required this.services,
    required this.description,
    super.key,
  });
  final bool showDate;
  final DateTime date;
  final String description;
  final List<ServiceEntity> services;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDate) ...[
          Text(
            date.weekdayDayMonth(l10n),
            style: TextStyle(
              fontSize: Tokens.fontSize.ref16,
            ),
          ),
          SizedBox(height: Tokens.size.ref2),
        ],
        Clickable(
          onTap: () {},
          color: Tokens.colors.primary,
          padding: EdgeInsets.all(Tokens.size.ref3),
          decoration: BoxDecoration(
            color: Tokens.colors.primary,
            borderRadius: BorderRadius.circular(Tokens.radius.normal),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: services.map((e) {
                      return Text(
                        '• ${e.name}',
                        style: TextStyle(
                          color: Tokens.colors.background,
                          fontSize: Tokens.fontSize.ref16,
                        ),
                      );
                    }).toList(),
                  ),
                  const Spacer(),
                  Text(
                    date.hourAndMinute(),
                    style: TextStyle(
                      color: Tokens.colors.background,
                      fontSize: Tokens.fontSize.ref10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Tokens.size.ref3),
              Text(
                description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Tokens.colors.background,
                  fontSize: Tokens.fontSize.ref10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
