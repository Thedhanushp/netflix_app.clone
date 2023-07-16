import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/downloads/core/failures/main_failure.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';

abstract class IdownloadRepo {
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImage();
}
