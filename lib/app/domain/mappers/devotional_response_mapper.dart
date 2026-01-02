import 'package:pray_app/app/data/models/devotional_response_model.dart';
import 'package:pray_app/app/domain/entities/devotional_response_entity.dart';
import 'package:pray_app/app/domain/mappers/devotional_mapper.dart';

class DevotionalResponseMapper {
  static DevotionalResponseEntity fromModel(DevotionalResponseModel model) {
    return DevotionalResponseEntity(
      success: model.success,
      data: DevotionalMapper.fromModel(model.data),
      message: model.message,
    );
  }

  static DevotionalResponseModel fromEntity(DevotionalResponseEntity entity) {
    return DevotionalResponseModel(
      success: entity.success,
      data: DevotionalMapper.fromEntity(entity.data),
      message: entity.message,
    );
  }
}
