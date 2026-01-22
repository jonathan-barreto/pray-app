import 'dart:convert';

class PasswordResetConfirmParams {
  final String email;
  final String code;
  final String newPassword;

  const PasswordResetConfirmParams({
    required this.email,
    required this.code,
    required this.newPassword,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'code': code,
      'new_password': newPassword,
    };
  }

  String toJson() => jsonEncode(toMap());
}
