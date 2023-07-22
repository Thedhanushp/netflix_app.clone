import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/core/failures/main_failure.dart';

import 'package:netflix_app/domain/hot_and_new/hot_and_new_resp/model/hot_and_new_resp.dart';

import '../../domain/downloads/core/api_end_points.dart';
import '../../domain/hot_and_new/hot_and_new_resp/hot_and_new_service.dart';

@LazySingleton(as: HotAndNewSevice)
class HotAndNewImplementation implements HotAndNewSevice {
  @override
  Future<Either<MainFailures, HotAndNewResp>> getHotAndNewMovieData() async {
    try {
      final response =
          await Dio(BaseOptions()).get(ApiEndPoints.HotAndNewMovie);

      //log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } on DioException catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }

  @override
  Future<Either<MainFailures, HotAndNewResp>> getHotAndNewTvData() async {
    try {
      final response = await Dio(BaseOptions()).get(ApiEndPoints.HotAndNewTv);

      //log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } on DioException catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }
}
