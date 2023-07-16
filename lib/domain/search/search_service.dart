import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/downloads/core/failures/main_failure.dart';
import 'package:netflix_app/domain/search/models/search_responce/search_responce.dart';

abstract class SearchService {
  Future<Either<MainFailures, SearchResponce>> searchMovies({
    required String movieQuery,
  });
}
