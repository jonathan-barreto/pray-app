import 'package:pray_app/app/data/models/dashboard_data_model.dart';
import 'package:pray_app/app/domain/entities/dashboard_data_entity.dart';
import 'package:pray_app/app/domain/mappers/calendar_day_mapper.dart';
import 'package:pray_app/app/domain/mappers/devotional_mapper.dart';
import 'package:pray_app/app/domain/mappers/passage_mapper.dart';

class DashboardDataMapper {
  static DashboardDataEntity fromModel(DashboardDataModel model) {
    return DashboardDataEntity(
      publicDevotional: model.publicDevotional != null
          ? DevotionalMapper.fromModel(model.publicDevotional!)
          : null,
      passage: model.passage != null
          ? PassageMapper.fromModel(model.passage!)
          : null,
      calendar: model.calendar
          .map((calendarDay) => CalendarDayMapper.fromModel(calendarDay))
          .toList(),
    );
  }

  static DashboardDataModel fromEntity(DashboardDataEntity entity) {
    return DashboardDataModel(
      publicDevotional: entity.publicDevotional != null
          ? DevotionalMapper.fromEntity(entity.publicDevotional!)
          : null,
      passage: entity.passage != null
          ? PassageMapper.fromEntity(entity.passage!)
          : null,
      calendar: entity.calendar
          .map((calendarDay) => CalendarDayMapper.fromEntity(calendarDay))
          .toList(),
    );
  }
}
