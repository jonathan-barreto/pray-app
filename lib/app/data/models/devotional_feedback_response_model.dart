import 'dart:convert';

import 'package:pray_app/app/data/models/devotional_feedback_model.dart';

class DevotionalFeedbackResponseModel {
  final bool success;
  final String message;
  final DevotionalFeedbackModel data;

  const DevotionalFeedbackResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DevotionalFeedbackResponseModel.fromJson(String source) {
    return DevotionalFeedbackResponseModel.fromMap(jsonDecode(source));
  }

  factory DevotionalFeedbackResponseModel.fromMap(Map<String, dynamic> map) {
    return DevotionalFeedbackResponseModel(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      data: DevotionalFeedbackModel.fromMap(map['data'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {'success': success, 'message': message, 'data': data.toMap()};
  }

  String toJson() => jsonEncode(toMap());
}
