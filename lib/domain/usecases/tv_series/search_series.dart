import 'package:dartz/dartz.dart';

import 'package:core/core.dart';
import '../../entities/tv_series/series.dart';
import '../../repositories/series_repository.dart';

class SearchTvSeriess {
  final TvSeriesRepository repository;

  SearchTvSeriess(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute(String query) {
    return repository.searchTvSeriess(query);
  }
}
