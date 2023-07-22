import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_app/core/constants.dart';

part 'search_responce.g.dart';

@JsonSerializable()
class SearchResponce {
  @JsonKey(name: 'results')
  List<searchResultData> results;

  SearchResponce({
    this.results = const [],
  });

  factory SearchResponce.fromJson(Map<String, dynamic> json) {
    return _$SearchResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResponceToJson(this);
}

@JsonSerializable()
class searchResultData {
  // @JsonKey(name: 'id')
  // int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  String get posterImageUrl => '$imageAppentUrl$posterPath';

  searchResultData({
    // this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory searchResultData.fromJson(Map<String, dynamic> json) {
    return _$searchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$searchResultDataToJson(this);
}
