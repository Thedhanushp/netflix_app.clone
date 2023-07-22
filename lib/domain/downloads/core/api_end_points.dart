import 'package:netflix_app/core/string.dart';
import 'package:netflix_app/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kbaseUrl/trending/all/day?api_key=$ApiKey";
  static const search = '$kbaseUrl/search/movie?api_key=$ApiKey';
  static const HotAndNewMovie = '$kbaseUrl/discover/movie?api_key=$ApiKey';
  static const HotAndNewTv = '$kbaseUrl/discover/tv?api_key=$ApiKey';
}
