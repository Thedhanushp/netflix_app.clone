import 'dart:developer';
//import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix_app/domain/downloads/core/failures/main_failure.dart';
import 'package:netflix_app/domain/search/models/search_responce/search_responce.dart';
import 'package:netflix_app/domain/search/search_service.dart';
import 'package:injectable/injectable.dart';
import '../../domain/downloads/core/api_end_points.dart';
//import '../../domain/downloads/models/downloads.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailures, SearchResponce>> searchMovies(
      {required String movieQuery}) async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          'query': movieQuery,
        },
      );
      //log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponce.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  } //override
}
