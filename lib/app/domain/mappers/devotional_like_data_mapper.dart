import 'package:pray_app/app/data/models/devotional_like_response_model.dart';
import 'package:pray_app/app/domain/entities/devotional_like_data_entity.dart';

class DevotionalLikeDataMapper {
  static DevotionalLikeDataEntity fromModel(DevotionalLikeDataModel model) {
    return DevotionalLikeDataEntity(
      devotionalId: model.devotionalId,
      liked: model.liked,
      action: model.action,
    );
  }

  static DevotionalLikeDataModel fromEntity(DevotionalLikeDataEntity entity) {
    return DevotionalLikeDataModel(
      devotionalId: entity.devotionalId,
      liked: entity.liked,
      action: entity.action,
    );
  }
}
