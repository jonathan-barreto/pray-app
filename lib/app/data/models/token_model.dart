import 'dart:convert';

class TokenModel {
  final String accessToken;
  final String refreshToken;

  const TokenModel({required this.accessToken, required this.refreshToken});

  factory TokenModel.fromJson(String source) {
    return TokenModel.fromMap(jsonDecode(source));
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      accessToken: map['access_token'] ?? '',
      refreshToken: map['refresh_token'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'access_token': accessToken, 'refresh_token': refreshToken};
  }

  String toJson() => jsonEncode(toMap());
}
