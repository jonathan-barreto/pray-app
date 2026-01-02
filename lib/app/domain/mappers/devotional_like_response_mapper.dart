import 'package:pray_app/app/data/models/devotional_like_response_model.dart';
import 'package:pray_app/app/domain/entities/devotional_like_response_entity.dart';
import 'package:pray_app/app/domain/mappers/devotional_like_data_mapper.dart';

class DevotionalLikeResponseMapper {
  static DevotionalLikeResponseEntity fromModel(
    DevotionalLikeResponseModel model,
  ) {
    return DevotionalLikeResponseEntity(
      success: model.success,
      message: model.message,
      data: DevotionalLikeDataMapper.fromModel(model.data),
    );
  }

  static DevotionalLikeResponseModel fromEntity(
    DevotionalLikeResponseEntity entity,
  ) {
    return DevotionalLikeResponseModel(
      success: entity.success,
      message: entity.message,
      data: DevotionalLikeDataMapper.fromEntity(entity.data),
    );
  }
}
