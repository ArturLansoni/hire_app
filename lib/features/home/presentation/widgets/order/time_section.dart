import 'package:flutter/material.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/utils/extensions/int_extension.dart';
import 'package:hire_app/core/utils/generate_future_dates.dart';
import 'package:hire_app/features/home/presentation/widgets/order/widgets.dart';

class TimeSection extends StatefulWidget {
  const TimeSection({
    required this.onSelectDate,
    required this.onSelectHour,
    super.key,
  });

  final void Function(DateTime date) onSelectDate;
  final void Function(int hour) onSelectHour;
  @override
  State<TimeSection> createState() => _TimeSectionState();
}

class _TimeSectionState extends State<TimeSection> {
  List<DateTime> get _dateInterval => generateFutureDates(7);
  static const _hoursInterval = [7, 8, 9, 10, 11, 13, 14, 15, 16, 17];
  int? _selectedDate;
  int? _selectedHour;

  void setSelectedDate(int index) {
    final newValue = index == _selectedDate ? null : index;
    setState(() => _selectedDate = newValue);
    widget.onSelectDate(_dateInterval[index]);
  }

  void setSelectedHour(int index) {
    final newValue = index == _selectedHour ? null : index;
    setState(() => _selectedHour = newValue);
    widget.onSelectHour(_hoursInterval[index]);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    String getWeekdayName(int index) {
      return switch (index) {
        1 => l10n.monday,
        2 => l10n.tuesday,
        3 => l10n.wednesday,
        4 => l10n.thursday,
        5 => l10n.friday,
        6 => l10n.saturday,
        _ => l10n.sunday,
      };
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.timeSectionSelectDate),
        SizedBox(height: Tokens.size.ref2),
        SizedBox(
          height: Tokens.size.ref18,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final item = _dateInterval[index];
              return TimeItem(
                top: item.day.pad(),
                bottom: getWeekdayName(item.weekday),
                onTap: () => setSelectedDate(index),
                isSelected: _selectedDate == null || index == _selectedDate,
              );
            },
            separatorBuilder: (_, index) {
              return SizedBox(width: Tokens.size.ref1);
            },
            itemCount: _dateInterval.length,
          ),
        ),
        SizedBox(height: Tokens.size.ref3),
        Text(l10n.timeSectionSelectHour),
        SizedBox(height: Tokens.size.ref2),
        SizedBox(
          height: Tokens.size.ref18,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final item = _hoursInterval[index];
              return TimeItem(
                top: item.pad(),
                bottom: '00',
                onTap: () => setSelectedHour(index),
                isSelected: _selectedHour == null || index == _selectedHour,
              );
            },
            separatorBuilder: (_, index) {
              return SizedBox(width: Tokens.size.ref1);
            },
            itemCount: _hoursInterval.length,
          ),
        ),
      ],
    );
  }
}
