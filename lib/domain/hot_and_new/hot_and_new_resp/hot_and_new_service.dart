import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/downloads/core/failures/main_failure.dart';

import 'model/hot_and_new_resp.dart';

abstract class HotAndNewSevice {
  Future<Either<MainFailures, HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailures, HotAndNewResp>> getHotAndNewTvData();
}
