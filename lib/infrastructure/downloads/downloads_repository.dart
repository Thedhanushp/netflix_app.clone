//import 'dart:math';

//import 'dart:ffi';

import 'dart:developer';

import 'package:dartz/dartz.dart';
//import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/downloads/core/api_end_points.dart';

import 'package:netflix_app/domain/downloads/core/failures/main_failure.dart';
import 'package:dio/dio.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
//import 'package:netflix_app/infrastructure/downloads/downloads_repository.dart';

import '../../domain/downloads/i_downloads_repo.dart';

//override
@LazySingleton(as: IdownloadRepo)
class DownloadsRepository implements IdownloadRepo {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // final List<Downloads> downloadsList = [];
        // (response.data.toString());
        // for (final raw in response.data) {
        //   downloadsList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        // }
        final downloadsList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();

        print(downloadsList);
        return Right(downloadsList);
        //return right(downloadsList);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }
}
//