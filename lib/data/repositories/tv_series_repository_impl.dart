import 'package:dartz/dartz.dart';

import 'package:ditonton/domain/entities/tv_series/series_detail.dart';
import 'package:ditonton/domain/entities/tv_series/series.dart';

import 'package:ditonton/common/failure.dart';

import '../../domain/repositories/series_repository.dart';
import '../datasources/tv_series/series_local_data_source.dart';
import '../datasources/tv_series/series_remote_data_source.dart';

class TvSeriesRepositoryImpl implements TvSeriesRepository {
  final TvSeriesRemoteDataSource remoteDataSource;
  final TvSeriesLocalDataSource localDataSource;

  TvSeriesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<TvSeries>>> getNowPlayingTvSeriess() {
    // TODO: implement getNowPlayingTvSeriess
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getPopularTvSeriess() {
    // TODO: implement getPopularTvSeriess
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getTopRatedTvSeriess() {
    // TODO: implement getTopRatedTvSeriess
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TvSeriesDetail>> getTvSeriesDetail(int id) {
    // TODO: implement getTvSeriesDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getTvSeriesRecommendations(int id) {
    // TODO: implement getTvSeriesRecommendations
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TvSeries>>> getWatchlistTvSeriess() {
    // TODO: implement getWatchlistTvSeriess
    throw UnimplementedError();
  }

  @override
  Future<bool> isAddedToWatchlist(int id) {
    // TODO: implement isAddedToWatchlist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> removeWatchlist(TvSeriesDetail movie) {
    // TODO: implement removeWatchlist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> saveWatchlist(TvSeriesDetail movie) {
    // TODO: implement saveWatchlist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TvSeries>>> searchTvSeriess(String query) {
    // TODO: implement searchTvSeriess
    throw UnimplementedError();
  }
}
