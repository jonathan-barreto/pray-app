class PassageEntity {
  final int id;
  final String verseReference;
  final String verseText;
  final int readingTimeEstimate;
  final String createdAt;
  final String updatedAt;
  final String description;
  final bool liked;

  const PassageEntity({
    required this.id,
    required this.verseReference,
    required this.verseText,
    required this.readingTimeEstimate,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.liked,
  });
}
