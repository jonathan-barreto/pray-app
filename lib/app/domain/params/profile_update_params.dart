import 'dart:convert';

class ProfileUpdateParams {
  final String name;

  const ProfileUpdateParams({required this.name});

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  String toJson() => jsonEncode(toMap());
}
