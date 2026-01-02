import 'package:pray_app/app/data/models/user_model.dart';
import 'package:pray_app/app/domain/entities/user_entity.dart';
import 'package:pray_app/app/domain/mappers/user_metrics_mapper.dart';

class UserMapper {
  static UserEntity fromModel(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      metrics: model.metrics != null
          ? UserMetricsMapper.fromModel(model.metrics!)
          : null,
    );
  }

  static UserModel fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      metrics: entity.metrics != null
          ? UserMetricsMapper.fromEntity(entity.metrics!)
          : null,
    );
  }
}
