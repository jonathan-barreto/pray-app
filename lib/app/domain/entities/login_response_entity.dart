import 'package:pray_app/app/domain/entities/token_entity.dart';

class LoginResponseEntity {
  final bool success;
  final TokenEntity data;
  final String message;

  const LoginResponseEntity({
    required this.success,
    required this.data,
    required this.message,
  });
}
