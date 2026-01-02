import 'dart:convert';

class DevotionalModel {
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

  const DevotionalModel({
    required this.id,
    required this.userId,
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

  factory DevotionalModel.fromJson(String source) {
    return DevotionalModel.fromMap(jsonDecode(source));
  }

  factory DevotionalModel.fromMap(Map<String, dynamic> map) {
    return DevotionalModel(
      id: map['id'] ?? 0,
      userId: map['user_id'] ?? '',
      title: map['title'] ?? '',
      verseReference: map['verse_reference'] ?? '',
      verseText: map['verse_text'] ?? '',
      reflection: map['reflection'] ?? '',
      application: map['application'] ?? '',
      prayer: map['prayer'] ?? '',
      readingTimeEstimate: map['reading_time_estimate'] ?? 0,
      evaluationNote: map['evaluation_note'],
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      description: map['description'] ?? '',
      feeling: map['feeling'],
      processing: map['processing'],
      liked: map['liked'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'verse_reference': verseReference,
      'verse_text': verseText,
      'reflection': reflection,
      'application': application,
      'prayer': prayer,
      'reading_time_estimate': readingTimeEstimate,
      'evaluation_note': evaluationNote,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'description': description,
      'feeling': feeling,
      'processing': processing,
      'liked': liked,
    };
  }

  String toJson() => jsonEncode(toMap());
}
