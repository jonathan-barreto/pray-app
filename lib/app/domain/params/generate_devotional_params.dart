import 'dart:convert';

class GenerateDevotionalParams {
  final String feeling;

  const GenerateDevotionalParams({required this.feeling});

  Map<String, dynamic> toMap() {
    return {'feeling': feeling};
  }

  String toJson() => jsonEncode(toMap());
}
