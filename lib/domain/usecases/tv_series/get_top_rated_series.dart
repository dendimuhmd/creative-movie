import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';

import '../../entities/tv_series/series.dart';
import '../../repositories/series_repository.dart';

class GetTopRatedTvSeriess {
  final TvSeriesRepository repository;

  GetTopRatedTvSeriess(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return repository.getTopRatedTvSeriess();
  }
}
