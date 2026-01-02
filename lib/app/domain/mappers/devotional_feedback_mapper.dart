import 'package:pray_app/app/data/models/devotional_feedback_model.dart';
import 'package:pray_app/app/domain/entities/devotional_feedback_entity.dart';

class DevotionalFeedbackMapper {
  static DevotionalFeedbackEntity fromModel(DevotionalFeedbackModel model) {
    return DevotionalFeedbackEntity(
      id: model.id,
      userId: model.userId,
      devotionalId: model.devotionalId,
      feedback: model.feedback,
      evaluationNote: model.evaluationNote,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  static DevotionalFeedbackModel fromEntity(DevotionalFeedbackEntity entity) {
    return DevotionalFeedbackModel(
      id: entity.id,
      userId: entity.userId,
      devotionalId: entity.devotionalId,
      feedback: entity.feedback,
      evaluationNote: entity.evaluationNote,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
