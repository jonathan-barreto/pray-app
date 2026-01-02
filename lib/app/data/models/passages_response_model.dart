import 'dart:convert';

import 'package:pray_app/app/data/models/pagination_model.dart';
import 'package:pray_app/app/data/models/passage_model.dart';

class PassagesResponseModel {
  final bool success;
  final PassagesDataModel data;
  final String message;

  const PassagesResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory PassagesResponseModel.fromJson(String source) {
    return PassagesResponseModel.fromMap(jsonDecode(source));
  }

  factory PassagesResponseModel.fromMap(Map<String, dynamic> map) {
    return PassagesResponseModel(
      success: map['success'] ?? false,
      data: PassagesDataModel.fromMap(map['data'] ?? {}),
      message: map['message'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'success': success, 'data': data.toMap(), 'message': message};
  }

  String toJson() => jsonEncode(toMap());
}

class PassagesDataModel {
  final List<PassageModel> passages;
  final PaginationModel pagination;

  const PassagesDataModel({required this.passages, required this.pagination});

  factory PassagesDataModel.fromJson(String source) {
    return PassagesDataModel.fromMap(jsonDecode(source));
  }

  factory PassagesDataModel.fromMap(Map<String, dynamic> map) {
    return PassagesDataModel(
      passages: List<PassageModel>.from(
        (map['passages'] ?? []).map((x) => PassageModel.fromMap(x)),
      ),
      pagination: PaginationModel.fromMap(map['pagination'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'passages': passages.map((x) => x.toMap()).toList(),
      'pagination': pagination.toMap(),
    };
  }

  String toJson() => jsonEncode(toMap());
}
