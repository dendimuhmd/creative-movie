// Mocks generated by Mockito 5.3.0 from annotations
// in tv_series/test/helpers/movie_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:core/core.dart' as _i3;
import 'package:core/domain/entities/movie/movie.dart' as _i5;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite_sqlcipher/sqflite.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeMovieDetailResponse_1 extends _i1.SmartFake
    implements _i3.MovieDetailResponse {
  _FakeMovieDetailResponse_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i3.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingMovies, []),
              returnValue:
                  _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>>.value(
                      _FakeEither_0<_i3.Failure, List<_i5.Movie>>(
                          this, Invocation.method(#getNowPlayingMovies, []))))
          as _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(Invocation.method(#getPopularMovies, []),
              returnValue:
                  _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>>.value(
                      _FakeEither_0<_i3.Failure, List<_i5.Movie>>(
                          this, Invocation.method(#getPopularMovies, []))))
          as _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedMovies, []),
              returnValue:
                  _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>>.value(
                      _FakeEither_0<_i3.Failure, List<_i5.Movie>>(
                          this, Invocation.method(#getTopRatedMovies, []))))
          as _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, _i3.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
              returnValue:
                  _i4.Future<_i2.Either<_i3.Failure, _i3.MovieDetail>>.value(
                      _FakeEither_0<_i3.Failure, _i3.MovieDetail>(
                          this, Invocation.method(#getMovieDetail, [id]))))
          as _i4.Future<_i2.Either<_i3.Failure, _i3.MovieDetail>>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
              returnValue:
                  _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>>.value(
                      _FakeEither_0<_i3.Failure, List<_i5.Movie>>(this,
                          Invocation.method(#getMovieRecommendations, [id]))))
          as _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
              returnValue:
                  _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>>.value(
                      _FakeEither_0<_i3.Failure, List<_i5.Movie>>(
                          this, Invocation.method(#searchMovies, [query]))))
          as _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, String>> saveWatchlist(
          _i3.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [movie]),
              returnValue: _i4.Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>(
                      this, Invocation.method(#saveWatchlist, [movie]))))
          as _i4.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, String>> removeWatchlist(
          _i3.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
              returnValue: _i4.Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>(
                      this, Invocation.method(#removeWatchlist, [movie]))))
          as _i4.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i4.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: _i4.Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue:
                  _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>>.value(
                      _FakeEither_0<_i3.Failure, List<_i5.Movie>>(
                          this, Invocation.method(#getWatchlistMovies, []))))
          as _i4.Future<_i2.Either<_i3.Failure, List<_i5.Movie>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i3.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i3.MovieModel>> getNowPlayingMovies() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingMovies, []),
              returnValue:
                  _i4.Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]))
          as _i4.Future<List<_i3.MovieModel>>);
  @override
  _i4.Future<List<_i3.MovieModel>> getPopularMovies() =>
      (super.noSuchMethod(Invocation.method(#getPopularMovies, []),
              returnValue:
                  _i4.Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]))
          as _i4.Future<List<_i3.MovieModel>>);
  @override
  _i4.Future<List<_i3.MovieModel>> getTopRatedMovies() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedMovies, []),
              returnValue:
                  _i4.Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]))
          as _i4.Future<List<_i3.MovieModel>>);
  @override
  _i4.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
              returnValue: _i4.Future<_i3.MovieDetailResponse>.value(
                  _FakeMovieDetailResponse_1(
                      this, Invocation.method(#getMovieDetail, [id]))))
          as _i4.Future<_i3.MovieDetailResponse>);
  @override
  _i4.Future<List<_i3.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
              returnValue:
                  _i4.Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]))
          as _i4.Future<List<_i3.MovieModel>>);
  @override
  _i4.Future<List<_i3.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
              returnValue:
                  _i4.Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]))
          as _i4.Future<List<_i3.MovieModel>>);
}

/// A class which mocks [MovieLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieLocalDataSource extends _i1.Mock
    implements _i3.MovieLocalDataSource {
  MockMovieLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<String> insertWatchlist(_i3.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: _i4.Future<String>.value('')) as _i4.Future<String>);
  @override
  _i4.Future<String> removeWatchlist(_i3.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: _i4.Future<String>.value('')) as _i4.Future<String>);
  @override
  _i4.Future<_i3.MovieTable?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: _i4.Future<_i3.MovieTable?>.value())
          as _i4.Future<_i3.MovieTable?>);
  @override
  _i4.Future<List<_i3.MovieTable>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue:
                  _i4.Future<List<_i3.MovieTable>>.value(<_i3.MovieTable>[]))
          as _i4.Future<List<_i3.MovieTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i3.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i6.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: _i4.Future<_i6.Database?>.value())
          as _i4.Future<_i6.Database?>);
  @override
  _i4.Future<int> insertWatchlist(_i3.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: _i4.Future<int>.value(0)) as _i4.Future<int>);
  @override
  _i4.Future<int> insertWatchlistSeries(_i3.TvSeriesTable? series) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistSeries, [series]),
          returnValue: _i4.Future<int>.value(0)) as _i4.Future<int>);
  @override
  _i4.Future<int> removeWatchlist(_i3.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: _i4.Future<int>.value(0)) as _i4.Future<int>);
  @override
  _i4.Future<int> removeWatchlistSeries(_i3.TvSeriesTable? series) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistSeries, [series]),
          returnValue: _i4.Future<int>.value(0)) as _i4.Future<int>);
  @override
  _i4.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: _i4.Future<Map<String, dynamic>?>.value())
          as _i4.Future<Map<String, dynamic>?>);
  @override
  _i4.Future<Map<String, dynamic>?> getSeriesById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getSeriesById, [id]),
              returnValue: _i4.Future<Map<String, dynamic>?>.value())
          as _i4.Future<Map<String, dynamic>?>);
  @override
  _i4.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue: _i4.Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i4.Future<List<Map<String, dynamic>>>);
  @override
  _i4.Future<List<Map<String, dynamic>>> getWatchlistSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistSeries, []),
              returnValue: _i4.Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i4.Future<List<Map<String, dynamic>>>);
}
