import 'dart:convert';

class PaginationModel {
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int itemsPerPage;
  final bool hasNextPage;
  final bool hasPreviousPage;

  const PaginationModel({
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.itemsPerPage,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory PaginationModel.fromJson(String source) {
    return PaginationModel.fromMap(jsonDecode(source));
  }

  factory PaginationModel.fromMap(Map<String, dynamic> map) {
    return PaginationModel(
      currentPage: map['current_page'] ?? 1,
      totalPages: map['total_pages'] ?? 1,
      totalItems: map['total_items'] ?? 0,
      itemsPerPage: map['items_per_page'] ?? 20,
      hasNextPage: map['has_next_page'] ?? false,
      hasPreviousPage: map['has_previous_page'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_page': currentPage,
      'total_pages': totalPages,
      'total_items': totalItems,
      'items_per_page': itemsPerPage,
      'has_next_page': hasNextPage,
      'has_previous_page': hasPreviousPage,
    };
  }

  String toJson() => jsonEncode(toMap());
}
