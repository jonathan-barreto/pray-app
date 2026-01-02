class DevotionalEntity {
  final int id;
  final String? userId;
  final String title;
  final String verseReference;
  final String verseText;
  final String reflection;
  final String application;
  final String prayer;
  final int readingTimeEstimate;
  final int? evaluationNote;
  final String createdAt;
  final String updatedAt;
  final String description;
  final String? feeling;
  final bool? processing;
  final bool? liked;

  const DevotionalEntity({
    required this.id,
    this.userId,
    required this.title,
    required this.verseReference,
    required this.verseText,
    required this.reflection,
    required this.application,
    required this.prayer,
    required this.readingTimeEstimate,
    this.evaluationNote,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    this.feeling,
    this.processing,
    this.liked,
  });
}
