import 'dart:convert';

class MessageResponseModel {
  final bool success;
  final String message;

  const MessageResponseModel({required this.success, required this.message});

  factory MessageResponseModel.fromJson(String source) {
    return MessageResponseModel.fromMap(jsonDecode(source));
  }

  factory MessageResponseModel.fromMap(Map<String, dynamic> map) {
    return MessageResponseModel(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'success': success, 'message': message};
  }

  String toJson() => jsonEncode(toMap());
}
