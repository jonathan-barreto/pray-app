import 'package:pray_app/app/data/models/calendar_day_model.dart';
import 'package:pray_app/app/domain/entities/calendar_day_entity.dart';

class CalendarDayMapper {
  static CalendarDayEntity fromModel(CalendarDayModel model) {
    return CalendarDayEntity(
      day: model.day,
      date: model.date,
      completed: model.completed,
      isToday: model.isToday,
    );
  }

  static CalendarDayModel fromEntity(CalendarDayEntity entity) {
    return CalendarDayModel(
      day: entity.day,
      date: entity.date,
      completed: entity.completed,
      isToday: entity.isToday,
    );
  }
}
