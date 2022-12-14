import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series/series_detail.dart';
import 'package:dartz/dartz.dart';

class GetTvSeriesDetail {
  final TvSeriesRepository repository;

  GetTvSeriesDetail(this.repository);

  Future<Either<Failure, TvSeriesDetail>> execute(int id) {
    return repository.getTvSeriesDetail(id);
  }
}
