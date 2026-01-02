import 'package:pray_app/app/data/models/pagination_model.dart';
import 'package:pray_app/app/domain/entities/pagination_entity.dart';

class PaginationMapper {
  static PaginationEntity fromModel(PaginationModel model) {
    return PaginationEntity(
      currentPage: model.currentPage,
      totalPages: model.totalPages,
      totalItems: model.totalItems,
      itemsPerPage: model.itemsPerPage,
      hasNextPage: model.hasNextPage,
      hasPreviousPage: model.hasPreviousPage,
    );
  }

  static PaginationModel fromEntity(PaginationEntity entity) {
    return PaginationModel(
      currentPage: entity.currentPage,
      totalPages: entity.totalPages,
      totalItems: entity.totalItems,
      itemsPerPage: entity.itemsPerPage,
      hasNextPage: entity.hasNextPage,
      hasPreviousPage: entity.hasPreviousPage,
    );
  }
}
