import 'package:pray_app/app/data/models/user_metrics_response_model.dart';
import 'package:pray_app/app/domain/entities/user_metrics_response_entity.dart';
import 'package:pray_app/app/domain/mappers/user_metrics_mapper.dart';

class UserMetricsResponseMapper {
  static UserMetricsResponseEntity fromModel(UserMetricsResponseModel model) {
    return UserMetricsResponseEntity(
      success: model.success,
      data: UserMetricsMapper.fromModel(model.data),
      message: model.message,
    );
  }

  static UserMetricsResponseModel fromEntity(UserMetricsResponseEntity entity) {
    return UserMetricsResponseModel(
      success: entity.success,
      data: UserMetricsMapper.fromEntity(entity.data),
      message: entity.message,
    );
  }
}
