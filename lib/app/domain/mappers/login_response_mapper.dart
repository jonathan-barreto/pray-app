import 'package:pray_app/app/data/models/login_response_model.dart';
import 'package:pray_app/app/domain/entities/login_response_entity.dart';
import 'package:pray_app/app/domain/mappers/token_mapper.dart';

class LoginResponseMapper {
  static LoginResponseEntity fromModel(LoginResponseModel model) {
    return LoginResponseEntity(
      success: model.success,
      data: TokenMapper.fromModel(model.data),
      message: model.message,
    );
  }

  static LoginResponseModel fromEntity(LoginResponseEntity entity) {
    return LoginResponseModel(
      success: entity.success,
      data: TokenMapper.fromEntity(entity.data),
      message: entity.message,
    );
  }
}
