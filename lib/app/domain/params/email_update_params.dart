import 'dart:convert';

class EmailUpdateParams {
  final String email;
  final String password;

  const EmailUpdateParams({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password};
  }

  String toJson() => jsonEncode(toMap());
}
