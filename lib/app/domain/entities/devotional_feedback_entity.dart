class DevotionalFeedbackEntity {
  final int id;
  final String userId;
  final int devotionalId;
  final String feedback;
  final int evaluationNote;
  final String createdAt;
  final String updatedAt;

  const DevotionalFeedbackEntity({
    required this.id,
    required this.userId,
    required this.devotionalId,
    required this.feedback,
    required this.evaluationNote,
    required this.createdAt,
    required this.updatedAt,
  });
}
