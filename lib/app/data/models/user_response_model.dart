import 'dart:convert';

import 'package:pray_app/app/data/models/user_model.dart';

class UserResponseModel {
  final bool success;
  final UserModel data;
  final String message;

  const UserResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory UserResponseModel.fromJson(String source) {
    return UserResponseModel.fromMap(jsonDecode(source));
  }

  factory UserResponseModel.fromMap(Map<String, dynamic> map) {
    return UserResponseModel(
      success: map['success'] ?? false,
      data: UserModel.fromMap(map['data'] ?? {}),
      message: map['message'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'success': success, 'data': data.toMap(), 'message': message};
  }

  String toJson() => jsonEncode(toMap());
}
