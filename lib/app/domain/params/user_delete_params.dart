import 'dart:convert';

class UserDeleteParams {
  final String password;

  const UserDeleteParams({required this.password});

  Map<String, dynamic> toMap() {
    return {'password': password};
  }

  String toJson() => jsonEncode(toMap());
}
