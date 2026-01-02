import 'dart:convert';

import 'package:pray_app/app/data/models/user_metrics_model.dart';

class UserMetricsResponseModel {
  final bool success;
  final UserMetricsModel data;
  final String message;

  const UserMetricsResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory UserMetricsResponseModel.fromJson(String source) {
    return UserMetricsResponseModel.fromMap(jsonDecode(source));
  }

  factory UserMetricsResponseModel.fromMap(Map<String, dynamic> map) {
    return UserMetricsResponseModel(
      success: map['success'] ?? false,
      data: UserMetricsModel.fromMap(map['data'] ?? {}),
      message: map['message'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'success': success, 'data': data.toMap(), 'message': message};
  }

  String toJson() => jsonEncode(toMap());
}
