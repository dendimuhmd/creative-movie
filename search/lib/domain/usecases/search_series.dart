import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series/series.dart';
import 'package:dartz/dartz.dart';

class SearchTvSeriess {
  final TvSeriesRepository repository;

  SearchTvSeriess(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute(String query) {
    return repository.searchTvSeriess(query);
  }
}
