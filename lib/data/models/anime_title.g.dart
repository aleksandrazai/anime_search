// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_title.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      lastVisiblePage: json['lastVisiblePage'] as int?,
      hasNextPage: json['hasNextPage'] as bool?,
      currentPage: json['currentPage'] as int?,
      items: json['items'] == null
          ? null
          : Items.fromJson(json['items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'lastVisiblePage': instance.lastVisiblePage,
      'hasNextPage': instance.hasNextPage,
      'currentPage': instance.currentPage,
      'items': instance.items,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      count: json['count'] as int?,
      total: json['total'] as int?,
      perPage: json['perPage'] as int?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'count': instance.count,
      'total': instance.total,
      'perPage': instance.perPage,
    };

AnimeTitle _$AnimeTitleFromJson(Map<String, dynamic> json) => AnimeTitle(
      title: json['title'] as String?,
    );

Map<String, dynamic> _$AnimeTitleToJson(AnimeTitle instance) =>
    <String, dynamic>{
      'title': instance.title,
    };

AnimeSearchResponse _$AnimeSearchResponseFromJson(Map<String, dynamic> json) =>
    AnimeSearchResponse(
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AnimeTitle.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: json['items'] == null
          ? null
          : Items.fromJson(json['items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeSearchResponseToJson(
        AnimeSearchResponse instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'items': instance.items,
      'data': instance.data,
    };
