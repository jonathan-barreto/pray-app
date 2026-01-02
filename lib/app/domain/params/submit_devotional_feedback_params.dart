import 'dart:convert';

class SubmitDevotionalFeedbackParams {
  final int devotionalId;
  final String feedback;
  final int evaluationNote;

  const SubmitDevotionalFeedbackParams({
    required this.devotionalId,
    required this.feedback,
    required this.evaluationNote,
  });

  Map<String, dynamic> toMap() {
    return {
      'devotional_id': devotionalId,
      'feedback': feedback,
      'evaluation_note': evaluationNote,
    };
  }

  String toJson() => jsonEncode(toMap());
}
