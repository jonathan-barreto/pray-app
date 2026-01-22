import 'dart:convert';

class PasswordResetResponseModel {
  final bool success;
  final String message;

  const PasswordResetResponseModel({
    required this.success,
    required this.message,
  });

  factory PasswordResetResponseModel.fromJson(String source) {
    return PasswordResetResponseModel.fromMap(jsonDecode(source));
  }

  factory PasswordResetResponseModel.fromMap(Map<String, dynamic> map) {
    return PasswordResetResponseModel(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
    };
  }

  String toJson() => jsonEncode(toMap());
}
