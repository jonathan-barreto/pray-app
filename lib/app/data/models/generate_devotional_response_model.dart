import 'dart:convert';

import 'package:pray_app/app/data/models/devotional_model.dart';

class GenerateDevotionalResponseModel {
  final bool success;
  final DevotionalModel data;
  final String message;

  const GenerateDevotionalResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory GenerateDevotionalResponseModel.fromJson(String source) {
    return GenerateDevotionalResponseModel.fromMap(jsonDecode(source));
  }

  factory GenerateDevotionalResponseModel.fromMap(Map<String, dynamic> map) {
    return GenerateDevotionalResponseModel(
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
