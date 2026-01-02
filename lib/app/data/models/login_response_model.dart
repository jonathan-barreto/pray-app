import 'dart:convert';

import 'package:pray_app/app/data/models/token_model.dart';

class LoginResponseModel {
  final bool success;
  final TokenModel data;
  final String message;

  const LoginResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory LoginResponseModel.fromJson(String source) {
    return LoginResponseModel.fromMap(jsonDecode(source));
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      success: map['success'] ?? false,
      data: TokenModel.fromMap(map['data'] ?? {}),
      message: map['message'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'success': success, 'data': data.toMap(), 'message': message};
  }

  String toJson() => jsonEncode(toMap());
}
