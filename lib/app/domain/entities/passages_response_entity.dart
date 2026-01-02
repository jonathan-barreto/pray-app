import 'package:pray_app/app/domain/entities/pagination_entity.dart';
import 'package:pray_app/app/domain/entities/passage_entity.dart';

class PassagesResponseEntity {
  final bool success;
  final PassagesDataEntity data;
  final String message;

  const PassagesResponseEntity({
    required this.success,
    required this.data,
    required this.message,
  });
}

class PassagesDataEntity {
  final List<PassageEntity> passages;
  final PaginationEntity pagination;

  const PassagesDataEntity({required this.passages, required this.pagination});
}
