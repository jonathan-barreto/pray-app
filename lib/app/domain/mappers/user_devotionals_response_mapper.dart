import 'package:pray_app/app/data/models/user_devotionals_response_model.dart';
import 'package:pray_app/app/domain/entities/user_devotionals_response_entity.dart';
import 'package:pray_app/app/domain/mappers/user_devotionals_data_mapper.dart';

class UserDevotionalsResponseMapper {
  static UserDevotionalsResponseEntity fromModel(
    UserDevotionalsResponseModel model,
  ) {
    return UserDevotionalsResponseEntity(
      success: model.success,
      data: UserDevotionalsDataMapper.fromModel(model.data),
      message: model.message,
    );
  }

  static UserDevotionalsResponseModel fromEntity(
    UserDevotionalsResponseEntity entity,
  ) {
    return UserDevotionalsResponseModel(
      success: entity.success,
      data: UserDevotionalsDataMapper.fromEntity(entity.data),
      message: entity.message,
    );
  }
}
