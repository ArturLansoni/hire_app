List<DateTime> generateFutureDates(int numberOfDays) {
  final currentDate = DateTime.now();
  final futureDates = <DateTime>[];
  for (var dayIndex = 0; dayIndex < numberOfDays; dayIndex++) {
    futureDates.add(currentDate.add(Duration(days: dayIndex + 1)));
  }
  return futureDates;
}
