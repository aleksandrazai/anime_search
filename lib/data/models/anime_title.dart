import 'package:json_annotation/json_annotation.dart';

part 'anime_title.g.dart';

@JsonSerializable()
class Pagination {
  final int? lastVisiblePage;
  final bool? hasNextPage;
  final int? currentPage;
  final Items? items;

  Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class Items {
  final int? count;
  final int? total;
  final int? perPage;

  Items({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class AnimeTitle {
  AnimeTitle({required this.title});
  final String? title;

  factory AnimeTitle.fromJson(Map<String, dynamic> json) =>
      _$AnimeTitleFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeTitleToJson(this);
}

@JsonSerializable()
class AnimeSearchResponse {
  final Pagination? pagination;
  final Items? items;
  final List<AnimeTitle>? data;

  AnimeSearchResponse({
    this.pagination,
    this.data,
    this.items,
  });

  factory AnimeSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeSearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeSearchResponseToJson(this);
}
