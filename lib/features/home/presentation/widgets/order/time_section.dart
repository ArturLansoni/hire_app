import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/utils/extensions/date_extension.dart';
import 'package:hire_app/core/utils/extensions/int_extension.dart';
import 'package:hire_app/core/utils/generate_future_dates.dart';
import 'package:hire_app/core/widgets/widgets.dart';
import 'package:hire_app/features/home/presentation/widgets/order/widgets.dart';

class TimeSection extends StatefulWidget {
  const TimeSection({
    required this.onSelectDate,
    required this.onSelectHour,
    super.key,
    this.dateValidator,
    this.hourValidator,
  });

  final FormFieldValidator<DateTime>? dateValidator;
  final FormFieldValidator<int>? hourValidator;
  final void Function(DateTime? date) onSelectDate;
  final void Function(int? hour) onSelectHour;
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
    widget.onSelectDate(newValue == null ? null : _dateInterval[newValue]);
  }

  void setSelectedHour(int index) {
    final newValue = index == _selectedHour ? null : index;
    setState(() => _selectedHour = newValue);
    widget.onSelectHour(newValue == null ? null : _hoursInterval[newValue]);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.timeSectionSelectDate),
        SizedBox(height: Tokens.size.ref2),
        SizedBox(
          height: Tokens.size.ref24,
          child: TimeFormField(
            itemBuilder: (index) {
              final item = _dateInterval[index];
              return TimeItem(
                top: item.day.pad(),
                bottom: item.weekdayName(l10n),
                onTap: () => setSelectedDate(index),
                isSelected: _selectedDate == null || index == _selectedDate,
              );
            },
            itemCount: _dateInterval.length,
            validator: widget.dateValidator ?? (_) => null,
          ),
        ),
        Text(l10n.timeSectionSelectHour),
        SizedBox(height: Tokens.size.ref2),
        SizedBox(
          height: Tokens.size.ref24,
          child: TimeFormField(
            itemBuilder: (index) {
              final item = _hoursInterval[index];
              return TimeItem(
                top: item.pad(),
                bottom: '00',
                onTap: () => setSelectedHour(index),
                isSelected: _selectedHour == null || index == _selectedHour,
              );
            },
            itemCount: _hoursInterval.length,
            validator: widget.hourValidator ?? (_) => null,
          ),
        ),
      ],
    );
  }
}
