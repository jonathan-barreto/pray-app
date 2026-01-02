import 'package:pray_app/app/data/models/devotional_feedback_response_model.dart';
import 'package:pray_app/app/domain/entities/devotional_feedback_response_entity.dart';
import 'package:pray_app/app/domain/mappers/devotional_feedback_mapper.dart';

class DevotionalFeedbackResponseMapper {
  static DevotionalFeedbackResponseEntity fromModel(
    DevotionalFeedbackResponseModel model,
  ) {
    return DevotionalFeedbackResponseEntity(
      success: model.success,
      message: model.message,
      data: DevotionalFeedbackMapper.fromModel(model.data),
    );
  }

  static DevotionalFeedbackResponseModel fromEntity(
    DevotionalFeedbackResponseEntity entity,
  ) {
    return DevotionalFeedbackResponseModel(
      success: entity.success,
      message: entity.message,
      data: DevotionalFeedbackMapper.fromEntity(entity.data),
    );
  }
}
