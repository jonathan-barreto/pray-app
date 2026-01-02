import 'dart:convert';

import 'package:pray_app/app/data/models/devotional_model.dart';

class DevotionalResponseModel {
  final bool success;
  final DevotionalModel data;
  final String message;

  const DevotionalResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory DevotionalResponseModel.fromJson(String source) {
    return DevotionalResponseModel.fromMap(jsonDecode(source));
  }

  factory DevotionalResponseModel.fromMap(Map<String, dynamic> map) {
    return DevotionalResponseModel(
      success: map['success'] ?? false,
      data: DevotionalModel.fromMap(map['data'] ?? {}),
      message: map['message'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'success': success, 'data': data.toMap(), 'message': message};
  }

  String toJson() => jsonEncode(toMap());
}
