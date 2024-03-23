import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/utils/extensions/int_extension.dart';

extension DateExtension on DateTime {
  String hourAndMinute() {
    return '${hour.pad()}:${minute.pad()}';
  }

  String weekdayDayMonth(AppLocalizations l10n) {
    return '${weekdayName(l10n)} ${day.pad()}/${month.pad()}';
  }

  String weekdayName(AppLocalizations l10n) {
    return switch (weekday) {
      1 => l10n.monday,
      2 => l10n.tuesday,
      3 => l10n.wednesday,
      4 => l10n.thursday,
      5 => l10n.friday,
      6 => l10n.saturday,
      _ => l10n.sunday,
    };
  }
}
