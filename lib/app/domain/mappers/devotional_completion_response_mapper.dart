import 'package:pray_app/app/data/models/devotional_completion_response_model.dart';
import 'package:pray_app/app/domain/entities/devotional_completion_response_entity.dart';

class DevotionalCompletionResponseMapper {
  static DevotionalCompletionResponseEntity fromModel(
    DevotionalCompletionResponseModel model,
  ) {
    return DevotionalCompletionResponseEntity(
      success: model.success,
      message: model.message,
    );
  }

  static DevotionalCompletionResponseModel fromEntity(
    DevotionalCompletionResponseEntity entity,
  ) {
    return DevotionalCompletionResponseModel(
      success: entity.success,
      message: entity.message,
    );
  }
}
