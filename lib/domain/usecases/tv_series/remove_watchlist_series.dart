import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../entities/tv_series/series_detail.dart';
import '../../repositories/series_repository.dart';

class RemoveWatchlistTvSeries {
  final TvSeriesRepository repository;

  RemoveWatchlistTvSeries(this.repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail series) {
    return repository.removeWatchlist(series);
  }
}
