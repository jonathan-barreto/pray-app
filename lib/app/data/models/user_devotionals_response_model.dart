import 'dart:convert';

import 'package:pray_app/app/data/models/devotional_model.dart';
import 'package:pray_app/app/data/models/pagination_model.dart';

class UserDevotionalsResponseModel {
  final bool success;
  final UserDevotionalsDataModel data;
  final String message;

  const UserDevotionalsResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory UserDevotionalsResponseModel.fromJson(String source) {
    return UserDevotionalsResponseModel.fromMap(jsonDecode(source));
  }

  factory UserDevotionalsResponseModel.fromMap(Map<String, dynamic> map) {
    return UserDevotionalsResponseModel(
      success: map['success'] ?? false,
      data: UserDevotionalsDataModel.fromMap(map['data'] ?? {}),
      message: map['message'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'success': success, 'data': data.toMap(), 'message': message};
  }

  String toJson() => jsonEncode(toMap());
}

class UserDevotionalsDataModel {
  final List<DevotionalModel> devotionals;
  final PaginationModel pagination;

  const UserDevotionalsDataModel({
    required this.devotionals,
    required this.pagination,
  });

  factory UserDevotionalsDataModel.fromJson(String source) {
    return UserDevotionalsDataModel.fromMap(jsonDecode(source));
  }

  factory UserDevotionalsDataModel.fromMap(Map<String, dynamic> map) {
    return UserDevotionalsDataModel(
      devotionals: List<DevotionalModel>.from(
        (map['devotionals'] as List? ?? []).map(
          (x) => DevotionalModel.fromMap(x),
        ),
      ),
      pagination: PaginationModel.fromMap(map['pagination'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'devotionals': devotionals.map((x) => x.toMap()).toList(),
      'pagination': pagination.toMap(),
    };
  }

  String toJson() => jsonEncode(toMap());
}
