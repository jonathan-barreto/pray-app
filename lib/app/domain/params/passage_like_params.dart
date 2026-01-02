import 'dart:convert';

class PassageLikeParams {
  final int passageId;

  const PassageLikeParams({required this.passageId});

  Map<String, dynamic> toMap() {
    return {'passage_id': passageId};
  }

  String toJson() => jsonEncode(toMap());
}
