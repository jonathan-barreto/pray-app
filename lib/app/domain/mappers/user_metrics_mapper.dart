import 'package:pray_app/app/data/models/user_metrics_model.dart';
import 'package:pray_app/app/domain/entities/user_metrics_entity.dart';

class UserMetricsMapper {
  static UserMetricsEntity fromModel(UserMetricsModel model) {
    return UserMetricsEntity(
      streakDays: model.streakDays,
      streakMonths: model.streakMonths,
      streakYears: model.streakYears,
      longestStreak: model.longestStreak,
      devotionalsCompleted: model.devotionalsCompleted,
      passagesCompleted: model.passagesCompleted,
      rankPosition: model.rankPosition,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  static UserMetricsModel fromEntity(UserMetricsEntity entity) {
    return UserMetricsModel(
      streakDays: entity.streakDays,
      streakMonths: entity.streakMonths,
      streakYears: entity.streakYears,
      longestStreak: entity.longestStreak,
      devotionalsCompleted: entity.devotionalsCompleted,
      passagesCompleted: entity.passagesCompleted,
      rankPosition: entity.rankPosition,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
