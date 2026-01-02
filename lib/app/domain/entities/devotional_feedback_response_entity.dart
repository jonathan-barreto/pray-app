import 'package:pray_app/app/domain/entities/devotional_feedback_entity.dart';

class DevotionalFeedbackResponseEntity {
  final bool success;
  final String message;
  final DevotionalFeedbackEntity data;

  const DevotionalFeedbackResponseEntity({
    required this.success,
    required this.message,
    required this.data,
  });
}
