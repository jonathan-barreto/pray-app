import 'dart:convert';

class PassageModel {
  final int id;
  final String verseReference;
  final String verseText;
  final int readingTimeEstimate;
  final String createdAt;
  final String updatedAt;
  final String description;
  final bool liked;

  const PassageModel({
    required this.id,
    required this.verseReference,
    required this.verseText,
    required this.readingTimeEstimate,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.liked,
  });

  factory PassageModel.fromJson(String source) {
    return PassageModel.fromMap(jsonDecode(source));
  }

  factory PassageModel.fromMap(Map<String, dynamic> map) {
    return PassageModel(
      id: map['id'] ?? 0,
      verseReference: map['verse_reference'] ?? '',
      verseText: map['verse_text'] ?? '',
      readingTimeEstimate: map['reading_time_estimate'] ?? 0,
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      description: map['description'] ?? '',
      liked: map['liked'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'verse_reference': verseReference,
      'verse_text': verseText,
      'reading_time_estimate': readingTimeEstimate,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'description': description,
      'liked': liked,
    };
  }

  String toJson() => jsonEncode(toMap());
}
