import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series/series_detail.dart';
import 'package:dartz/dartz.dart';

class SaveWatchlistTvSeries {
  final TvSeriesRepository repository;

  SaveWatchlistTvSeries(this.repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail series) {
    return repository.saveWatchlist(series);
  }
}
