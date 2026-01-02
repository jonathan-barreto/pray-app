import 'dart:convert';

class CalendarDayModel {
  final String day;
  final String date;
  final bool completed;
  final bool isToday;

  const CalendarDayModel({
    required this.day,
    required this.date,
    required this.completed,
    required this.isToday,
  });

  factory CalendarDayModel.fromJson(String source) {
    return CalendarDayModel.fromMap(jsonDecode(source));
  }

  factory CalendarDayModel.fromMap(Map<String, dynamic> map) {
    return CalendarDayModel(
      day: map['day'] ?? '',
      date: map['date'] ?? '',
      completed: map['completed'] ?? false,
      isToday: map['isToday'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'date': date,
      'completed': completed,
      'isToday': isToday,
    };
  }

  String toJson() => jsonEncode(toMap());
}
