import 'dart:convert';

class PrivateDevotionalLikeParams {
  final int privateDevotionalId;

  const PrivateDevotionalLikeParams({required this.privateDevotionalId});

  Map<String, dynamic> toMap() {
    return {'private_devotional_id': privateDevotionalId};
  }

  String toJson() => jsonEncode(toMap());
}

class PublicDevotionalLikeParams {
  final int publicDevotionalId;

  const PublicDevotionalLikeParams({required this.publicDevotionalId});

  Map<String, dynamic> toMap() {
    return {'public_devotional_id': publicDevotionalId};
  }

  String toJson() => jsonEncode(toMap());
}
