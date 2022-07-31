import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../entities/tv_series/series.dart';
import '../../repositories/series_repository.dart';

class GetPopularTvSeriess {
  final TvSeriesRepository repository;

  GetPopularTvSeriess(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return repository.getPopularTvSeriess();
  }
}
