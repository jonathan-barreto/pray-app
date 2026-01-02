import 'package:pray_app/app/data/models/passage_like_response_model.dart';
import 'package:pray_app/app/domain/entities/passage_like_response_entity.dart';

class PassageLikeResponseMapper {
  static PassageLikeResponseEntity fromModel(PassageLikeResponseModel model) {
    return PassageLikeResponseEntity(
      success: model.success,
      data: PassageLikeDataMapper.fromModel(model.data),
      message: model.message,
    );
  }

  static PassageLikeResponseModel fromEntity(PassageLikeResponseEntity entity) {
    return PassageLikeResponseModel(
      success: entity.success,
      data: PassageLikeDataMapper.fromEntity(entity.data),
      message: entity.message,
    );
  }
}

class PassageLikeDataMapper {
  static PassageLikeDataEntity fromModel(PassageLikeDataModel model) {
    return PassageLikeDataEntity(
      passageId: model.passageId,
      liked: model.liked,
      action: model.action,
    );
  }

  static PassageLikeDataModel fromEntity(PassageLikeDataEntity entity) {
    return PassageLikeDataModel(
      passageId: entity.passageId,
      liked: entity.liked,
      action: entity.action,
    );
  }
}
