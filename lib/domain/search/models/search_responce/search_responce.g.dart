// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponce _$SearchResponceFromJson(Map<String, dynamic> json) =>
    SearchResponce(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => searchResultData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchResponceToJson(SearchResponce instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

searchResultData _$searchResultDataFromJson(Map<String, dynamic> json) =>
    searchResultData(
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$searchResultDataToJson(searchResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
    };
