import 'package:pray_app/app/data/models/user_response_model.dart';
import 'package:pray_app/app/domain/entities/user_response_entity.dart';
import 'package:pray_app/app/domain/mappers/user_mapper.dart';

class UserResponseMapper {
  static UserResponseEntity fromModel(UserResponseModel model) {
    return UserResponseEntity(
      success: model.success,
      data: UserMapper.fromModel(model.data),
      message: model.message,
    );
  }

  static UserResponseModel fromEntity(UserResponseEntity entity) {
    return UserResponseModel(
      success: entity.success,
      data: UserMapper.fromEntity(entity.data),
      message: entity.message,
    );
  }
}
