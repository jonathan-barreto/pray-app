import 'dart:convert';

import 'package:pray_app/app/data/models/dashboard_data_model.dart';

class DashboardResponseModel {
  final bool success;
  final DashboardDataModel data;
  final String message;

  const DashboardResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory DashboardResponseModel.fromJson(String source) {
    return DashboardResponseModel.fromMap(jsonDecode(source));
  }

  factory DashboardResponseModel.fromMap(Map<String, dynamic> map) {
    return DashboardResponseModel(
      success: map['success'] ?? false,
      data: DashboardDataModel.fromMap(map['data'] ?? {}),
      message: map['message'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'success': success, 'data': data.toMap(), 'message': message};
  }

  String toJson() => jsonEncode(toMap());
}
