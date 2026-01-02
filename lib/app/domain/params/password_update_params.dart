import 'dart:convert';

class PasswordUpdateParams {
  final String currentPassword;
  final String newPassword;

  const PasswordUpdateParams({
    required this.currentPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toMap() {
    return {'current_password': currentPassword, 'new_password': newPassword};
  }

  String toJson() => jsonEncode(toMap());
}
