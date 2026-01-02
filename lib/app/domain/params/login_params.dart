import 'dart:convert';

class LoginParams {
  final String email;
  final String password;
  final String deviceToken;

  const LoginParams({
    required this.email,
    required this.password,
    required this.deviceToken,
  });

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password, 'device_token': deviceToken};
  }

  String toJson() => jsonEncode(toMap());
}
