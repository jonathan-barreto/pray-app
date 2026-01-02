import 'package:pray_app/app/domain/entities/calendar_day_entity.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';
import 'package:pray_app/app/domain/entities/passage_entity.dart';

class DashboardDataEntity {
  final DevotionalEntity? publicDevotional;
  final PassageEntity? passage;
  final List<CalendarDayEntity> calendar;

  const DashboardDataEntity({
    this.publicDevotional,
    this.passage,
    required this.calendar,
  });
}
