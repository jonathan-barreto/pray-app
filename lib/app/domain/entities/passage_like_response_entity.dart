class PassageLikeResponseEntity {
  final bool success;
  final PassageLikeDataEntity data;
  final String message;

  const PassageLikeResponseEntity({
    required this.success,
    required this.data,
    required this.message,
  });
}

class PassageLikeDataEntity {
  final int passageId;
  final bool liked;
  final String action;

  const PassageLikeDataEntity({
    required this.passageId,
    required this.liked,
    required this.action,
  });
}
