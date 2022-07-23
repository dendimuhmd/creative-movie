import 'package:dartz/dartz.dart';

import 'package:ditonton/common/failure.dart';

import '../../entities/tv_series/series.dart';
import '../../repositories/series_repository.dart';

class GetTvSeriesRecommendations {
  final TvSeriesRepository repository;

  GetTvSeriesRecommendations(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute(id) {
    return repository.getTvSeriesRecommendations(id);
  }
}
