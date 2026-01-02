import 'dart:convert';

class DevotionalFeedbackModel {
  final int id;
  final String userId;
  final int devotionalId;
  final String feedback;
  final int evaluationNote;
  final String createdAt;
  final String updatedAt;

  const DevotionalFeedbackModel({
    required this.id,
    required this.userId,
    required this.devotionalId,
    required this.feedback,
    required this.evaluationNote,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DevotionalFeedbackModel.fromJson(String source) {
    return DevotionalFeedbackModel.fromMap(jsonDecode(source));
  }

  factory DevotionalFeedbackModel.fromMap(Map<String, dynamic> map) {
    return DevotionalFeedbackModel(
      id: map['id'] ?? 0,
      userId: map['user_id'] ?? '',
      devotionalId: map['devotional_id'] ?? 0,
      feedback: map['feedback'] ?? '',
      evaluationNote: map['evaluation_note'] ?? 0,
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'devotional_id': devotionalId,
      'feedback': feedback,
      'evaluation_note': evaluationNote,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  String toJson() => jsonEncode(toMap());
}
