class CalendarDayEntity {
  final String day;
  final String date;
  final bool completed;
  final bool isToday;

  const CalendarDayEntity({
    required this.day,
    required this.date,
    required this.completed,
    required this.isToday,
  });
}
