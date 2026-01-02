import 'dart:convert';

class DevotionalLikeResponseModel {
  final bool success;
  final String message;
  final DevotionalLikeDataModel data;

  const DevotionalLikeResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DevotionalLikeResponseModel.fromJson(String source) {
    return DevotionalLikeResponseModel.fromMap(jsonDecode(source));
  }

  factory DevotionalLikeResponseModel.fromMap(Map<String, dynamic> map) {
    return DevotionalLikeResponseModel(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      data: DevotionalLikeDataModel.fromMap(map['data'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {'success': success, 'message': message, 'data': data.toMap()};
  }

  String toJson() => jsonEncode(toMap());
}

class DevotionalLikeDataModel {
  final int devotionalId;
  final bool liked;
  final String action;

  const DevotionalLikeDataModel({
    required this.devotionalId,
    required this.liked,
    required this.action,
  });

  factory DevotionalLikeDataModel.fromJson(String source) {
    return DevotionalLikeDataModel.fromMap(jsonDecode(source));
  }

  factory DevotionalLikeDataModel.fromMap(Map<String, dynamic> map) {
    // Handle both private and public devotional IDs
    final int devotionalId =
        map['private_devotional_id'] ?? map['public_devotional_id'] ?? 0;

    return DevotionalLikeDataModel(
      devotionalId: devotionalId,
      liked: map['liked'] ?? false,
      action: map['action'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'devotional_id': devotionalId, 'liked': liked, 'action': action};
  }

  String toJson() => jsonEncode(toMap());
}
