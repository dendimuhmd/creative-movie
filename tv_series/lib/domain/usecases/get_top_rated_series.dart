import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series/series.dart';
import 'package:dartz/dartz.dart';

class GetTopRatedTvSeriess {
  final TvSeriesRepository repository;

  GetTopRatedTvSeriess(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return repository.getTopRatedTvSeriess();
  }
}
