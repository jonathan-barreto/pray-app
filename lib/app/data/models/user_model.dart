import 'dart:convert';

import 'package:pray_app/app/data/models/user_metrics_model.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String createdAt;
  final String updatedAt;
  final UserMetricsModel? metrics;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    this.metrics,
  });

  factory UserModel.fromJson(String source) {
    return UserModel.fromMap(jsonDecode(source));
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      metrics: map['metrics'] != null
          ? UserMetricsModel.fromMap(map['metrics'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'metrics': metrics?.toMap(),
    };
  }

  String toJson() => jsonEncode(toMap());
}
