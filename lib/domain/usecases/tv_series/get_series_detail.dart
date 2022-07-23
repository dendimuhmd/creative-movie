import 'package:dartz/dartz.dart';

import 'package:ditonton/common/failure.dart';

import '../../entities/tv_series/series_detail.dart';
import '../../repositories/series_repository.dart';

class GetTvSeriesDetail {
  final TvSeriesRepository repository;

  GetTvSeriesDetail(this.repository);

  Future<Either<Failure, TvSeriesDetail>> execute(int id) {
    return repository.getTvSeriesDetail(id);
  }
}
