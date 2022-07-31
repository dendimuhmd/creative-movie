// Mocks generated by Mockito 5.1.0 from annotations
// in ditonton/test/movie/helper/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ditonton/common/failure.dart' as _i6;
import 'package:ditonton/data/datasources/db/database_helper.dart' as _i13;
import 'package:ditonton/data/datasources/movie/movie_local_data_source.dart'
    as _i11;
import 'package:ditonton/data/datasources/movie/movie_remote_data_source.dart'
    as _i9;
import 'package:ditonton/data/models/movie/movie_detail_model.dart' as _i3;
import 'package:ditonton/data/models/movie/movie_model.dart' as _i10;
import 'package:ditonton/data/models/movie/movie_table.dart' as _i12;
import 'package:ditonton/data/models/tv_series/series_table.dart' as _i15;
import 'package:ditonton/domain/entities/movie/movie.dart' as _i7;
import 'package:ditonton/domain/entities/movie/movie_detail.dart' as _i8;
import 'package:ditonton/domain/repositories/movie_repository.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i14;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeMovieDetailResponse_1 extends _i1.Fake
    implements _i3.MovieDetailResponse {}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i4.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingMovies, []),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i7.Movie>>>.value(
              _FakeEither_0<_i6.Failure, List<_i7.Movie>>())) as _i5
          .Future<_i2.Either<_i6.Failure, List<_i7.Movie>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(Invocation.method(#getPopularMovies, []),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i7.Movie>>>.value(
              _FakeEither_0<_i6.Failure, List<_i7.Movie>>())) as _i5
          .Future<_i2.Either<_i6.Failure, List<_i7.Movie>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i7.Movie>>>.value(
              _FakeEither_0<_i6.Failure, List<_i7.Movie>>())) as _i5
          .Future<_i2.Either<_i6.Failure, List<_i7.Movie>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i8.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
          returnValue: Future<_i2.Either<_i6.Failure, _i8.MovieDetail>>.value(
              _FakeEither_0<_i6.Failure, _i8.MovieDetail>())) as _i5
          .Future<_i2.Either<_i6.Failure, _i8.MovieDetail>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i7.Movie>>>.value(
              _FakeEither_0<_i6.Failure, List<_i7.Movie>>())) as _i5
          .Future<_i2.Either<_i6.Failure, List<_i7.Movie>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i7.Movie>>>.value(
              _FakeEither_0<_i6.Failure, List<_i7.Movie>>())) as _i5
          .Future<_i2.Either<_i6.Failure, List<_i7.Movie>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> saveWatchlist(
          _i8.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [movie]),
              returnValue: Future<_i2.Either<_i6.Failure, String>>.value(
                  _FakeEither_0<_i6.Failure, String>()))
          as _i5.Future<_i2.Either<_i6.Failure, String>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> removeWatchlist(
          _i8.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
              returnValue: Future<_i2.Either<_i6.Failure, String>>.value(
                  _FakeEither_0<_i6.Failure, String>()))
          as _i5.Future<_i2.Either<_i6.Failure, String>>);
  @override
  _i5.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<_i2.Either<_i6.Failure, List<_i7.Movie>>>.value(
              _FakeEither_0<_i6.Failure, List<_i7.Movie>>())) as _i5
          .Future<_i2.Either<_i6.Failure, List<_i7.Movie>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i9.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i10.MovieModel>> getNowPlayingMovies() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingMovies, []),
              returnValue:
                  Future<List<_i10.MovieModel>>.value(<_i10.MovieModel>[]))
          as _i5.Future<List<_i10.MovieModel>>);
  @override
  _i5.Future<List<_i10.MovieModel>> getPopularMovies() => (super.noSuchMethod(
          Invocation.method(#getPopularMovies, []),
          returnValue: Future<List<_i10.MovieModel>>.value(<_i10.MovieModel>[]))
      as _i5.Future<List<_i10.MovieModel>>);
  @override
  _i5.Future<List<_i10.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
          Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<List<_i10.MovieModel>>.value(<_i10.MovieModel>[]))
      as _i5.Future<List<_i10.MovieModel>>);
  @override
  _i5.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
              returnValue: Future<_i3.MovieDetailResponse>.value(
                  _FakeMovieDetailResponse_1()))
          as _i5.Future<_i3.MovieDetailResponse>);
  @override
  _i5.Future<List<_i10.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
              returnValue:
                  Future<List<_i10.MovieModel>>.value(<_i10.MovieModel>[]))
          as _i5.Future<List<_i10.MovieModel>>);
  @override
  _i5.Future<List<_i10.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
              returnValue:
                  Future<List<_i10.MovieModel>>.value(<_i10.MovieModel>[]))
          as _i5.Future<List<_i10.MovieModel>>);
}

/// A class which mocks [MovieLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieLocalDataSource extends _i1.Mock
    implements _i11.MovieLocalDataSource {
  MockMovieLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<String> insertWatchlist(_i12.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<String> removeWatchlist(_i12.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i12.MovieTable?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<_i12.MovieTable?>.value())
          as _i5.Future<_i12.MovieTable?>);
  @override
  _i5.Future<List<_i12.MovieTable>> getWatchlistMovies() => (super.noSuchMethod(
          Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<List<_i12.MovieTable>>.value(<_i12.MovieTable>[]))
      as _i5.Future<List<_i12.MovieTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i13.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i14.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<_i14.Database?>.value())
          as _i5.Future<_i14.Database?>);
  @override
  _i5.Future<int> insertWatchlist(_i12.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<int> insertWatchlistSeries(_i15.TvSeriesTable? series) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistSeries, [series]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<int> removeWatchlist(_i12.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<int> removeWatchlistSeries(_i15.TvSeriesTable? series) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistSeries, [series]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i5.Future<Map<String, dynamic>?>);
  @override
  _i5.Future<Map<String, dynamic>?> getSeriesById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getSeriesById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i5.Future<Map<String, dynamic>?>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getWatchlistSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistSeries, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
}
