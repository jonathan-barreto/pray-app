import 'dart:convert';

class PasswordResetRequestParams {
  final String email;

  const PasswordResetRequestParams({required this.email});

  Map<String, dynamic> toMap() {
    return {'email': email};
  }

  String toJson() => jsonEncode(toMap());
}
