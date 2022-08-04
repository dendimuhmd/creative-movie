import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series/series.dart';
import 'package:dartz/dartz.dart';

class GetNowPlayingTvSeriess {
  final TvSeriesRepository repository;

  GetNowPlayingTvSeriess(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return repository.getNowPlayingTvSeriess();
  }
}
