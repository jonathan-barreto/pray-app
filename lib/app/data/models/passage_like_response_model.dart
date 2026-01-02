import 'dart:convert';

class PassageLikeResponseModel {
  final bool success;
  final PassageLikeDataModel data;
  final String message;

  const PassageLikeResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory PassageLikeResponseModel.fromJson(String source) {
    return PassageLikeResponseModel.fromMap(jsonDecode(source));
  }

  factory PassageLikeResponseModel.fromMap(Map<String, dynamic> map) {
    return PassageLikeResponseModel(
      success: map['success'] ?? false,
      data: PassageLikeDataModel.fromMap(map['data'] ?? {}),
      message: map['message'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'success': success, 'data': data.toMap(), 'message': message};
  }

  String toJson() => jsonEncode(toMap());
}

class PassageLikeDataModel {
  final int passageId;
  final bool liked;
  final String action;

  const PassageLikeDataModel({
    required this.passageId,
    required this.liked,
    required this.action,
  });

  factory PassageLikeDataModel.fromJson(String source) {
    return PassageLikeDataModel.fromMap(jsonDecode(source));
  }

  factory PassageLikeDataModel.fromMap(Map<String, dynamic> map) {
    return PassageLikeDataModel(
      passageId: map['passage_id'] ?? 0,
      liked: map['liked'] ?? false,
      action: map['action'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'passage_id': passageId, 'liked': liked, 'action': action};
  }

  String toJson() => jsonEncode(toMap());
}
