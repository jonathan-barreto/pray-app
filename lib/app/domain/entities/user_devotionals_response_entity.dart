import 'package:pray_app/app/domain/entities/user_devotionals_data_entity.dart';

class UserDevotionalsResponseEntity {
  final bool success;
  final UserDevotionalsDataEntity data;
  final String message;

  const UserDevotionalsResponseEntity({
    required this.success,
    required this.data,
    required this.message,
  });
}
