import 'package:pray_app/app/data/models/password_reset_response_model.dart';
import 'package:pray_app/app/domain/entities/password_reset_response_entity.dart';

class PasswordResetResponseMapper {
  static PasswordResetResponseEntity fromModel(
    PasswordResetResponseModel model,
  ) {
    return PasswordResetResponseEntity(
      success: model.success,
      message: model.message,
    );
  }

  static PasswordResetResponseModel fromEntity(
    PasswordResetResponseEntity entity,
  ) {
    return PasswordResetResponseModel(
      success: entity.success,
      message: entity.message,
    );
  }
}
