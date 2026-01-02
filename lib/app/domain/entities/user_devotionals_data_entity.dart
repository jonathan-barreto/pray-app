import 'package:pray_app/app/domain/entities/devotional_entity.dart';
import 'package:pray_app/app/domain/entities/pagination_entity.dart';

class UserDevotionalsDataEntity {
  final List<DevotionalEntity> devotionals;
  final PaginationEntity pagination;

  const UserDevotionalsDataEntity({
    required this.devotionals,
    required this.pagination,
  });
}
