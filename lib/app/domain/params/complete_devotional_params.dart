import 'dart:convert';

class CompleteDevotionalParams {
  final int devotionalId;
  final String type;
  final String? completedAt;

  const CompleteDevotionalParams({
    required this.devotionalId,
    required this.type,
    this.completedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'devotional_id': devotionalId,
      'type': type,
      if (completedAt != null) 'completed_at': completedAt,
    };
  }

  String toJson() => jsonEncode(toMap());
}
