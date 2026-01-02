import 'package:pray_app/app/domain/entities/user_entity.dart';

class UserResponseEntity {
  final bool success;
  final UserEntity data;
  final String message;

  const UserResponseEntity({
    required this.success,
    required this.data,
    required this.message,
  });
}
