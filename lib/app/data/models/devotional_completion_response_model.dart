import 'dart:convert';

class DevotionalCompletionResponseModel {
  final bool success;
  final String message;

  const DevotionalCompletionResponseModel({
    required this.success,
    required this.message,
  });

  factory DevotionalCompletionResponseModel.fromJson(String source) {
    return DevotionalCompletionResponseModel.fromMap(jsonDecode(source));
  }

  factory DevotionalCompletionResponseModel.fromMap(Map<String, dynamic> map) {
    return DevotionalCompletionResponseModel(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'success': success, 'message': message};
  }

  String toJson() => jsonEncode(toMap());
}
