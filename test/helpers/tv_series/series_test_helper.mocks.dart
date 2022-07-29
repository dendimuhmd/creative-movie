// Mocks generated by Mockito 5.1.0 from annotations
// in ditonton/test/helpers/tv_series/series_test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:convert' as _i17;
import 'dart:typed_data' as _i18;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ditonton/common/failure.dart' as _i7;
import 'package:ditonton/data/datasources/db/database_helper.dart' as _i14;
import 'package:ditonton/data/datasources/tv_series/series_local_data_source.dart'
    as _i12;
import 'package:ditonton/data/datasources/tv_series/series_remote_data_source.dart'
    as _i10;
import 'package:ditonton/data/models/movie/movie_table.dart' as _i16;
import 'package:ditonton/data/models/tv_series/series_detail_model.dart' as _i3;
import 'package:ditonton/data/models/tv_series/series_model.dart' as _i11;
import 'package:ditonton/data/models/tv_series/series_table.dart' as _i13;
import 'package:ditonton/domain/entities/tv_series/series.dart' as _i8;
import 'package:ditonton/domain/entities/tv_series/series_detail.dart' as _i9;
import 'package:ditonton/domain/repositories/series_repository.dart' as _i5;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i15;

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

class _FakeTvSeriesDetailResponse_1 extends _i1.Fake
    implements _i3.TvSeriesDetailResponse {}

class _FakeResponse_2 extends _i1.Fake implements _i4.Response {}

class _FakeStreamedResponse_3 extends _i1.Fake implements _i4.StreamedResponse {
}

/// A class which mocks [TvSeriesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRepository extends _i1.Mock
    implements _i5.TvSeriesRepository {
  MockTvSeriesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>
      getNowPlayingTvSeriess() =>
          (super.noSuchMethod(Invocation.method(#getNowPlayingTvSeriess, []),
                  returnValue:
                      Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                          _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>()))
              as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>
      getPopularTvSeriess() =>
          (super.noSuchMethod(Invocation.method(#getPopularTvSeriess, []),
                  returnValue:
                      Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                          _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>()))
              as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>
      getTopRatedTvSeriess() =>
          (super.noSuchMethod(Invocation.method(#getTopRatedTvSeriess, []),
                  returnValue:
                      Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                          _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>()))
              as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.TvSeriesDetail>> getTvSeriesDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesDetail, [id]),
              returnValue:
                  Future<_i2.Either<_i7.Failure, _i9.TvSeriesDetail>>.value(
                      _FakeEither_0<_i7.Failure, _i9.TvSeriesDetail>()))
          as _i6.Future<_i2.Either<_i7.Failure, _i9.TvSeriesDetail>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>
      getTvSeriesRecommendations(int? id) => (super.noSuchMethod(
              Invocation.method(#getTvSeriesRecommendations, [id]),
              returnValue:
                  Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                      _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>()))
          as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>> searchTvSeriess(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTvSeriess, [query]),
              returnValue:
                  Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                      _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>()))
          as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveWatchlist(
          _i9.TvSeriesDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [movie]),
              returnValue: Future<_i2.Either<_i7.Failure, String>>.value(
                  _FakeEither_0<_i7.Failure, String>()))
          as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeWatchlist(
          _i9.TvSeriesDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
              returnValue: Future<_i2.Either<_i7.Failure, String>>.value(
                  _FakeEither_0<_i7.Failure, String>()))
          as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>
      getWatchlistTvSeriess() =>
          (super.noSuchMethod(Invocation.method(#getWatchlistTvSeriess, []),
                  returnValue:
                      Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>.value(
                          _FakeEither_0<_i7.Failure, List<_i8.TvSeries>>()))
              as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TvSeries>>>);
}

/// A class which mocks [TvSeriesRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRemoteDataSource extends _i1.Mock
    implements _i10.TvSeriesRemoteDataSource {
  MockTvSeriesRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i11.TvSeriesModel>> getNowPlayingTvSeriess() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingTvSeriess, []),
          returnValue: Future<List<_i11.TvSeriesModel>>.value(
              <_i11.TvSeriesModel>[])) as _i6.Future<List<_i11.TvSeriesModel>>);
  @override
  _i6.Future<List<_i11.TvSeriesModel>> getPopularTvSeriess() =>
      (super.noSuchMethod(Invocation.method(#getPopularTvSeriess, []),
          returnValue: Future<List<_i11.TvSeriesModel>>.value(
              <_i11.TvSeriesModel>[])) as _i6.Future<List<_i11.TvSeriesModel>>);
  @override
  _i6.Future<List<_i11.TvSeriesModel>> getTopRatedTvSeriess() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTvSeriess, []),
          returnValue: Future<List<_i11.TvSeriesModel>>.value(
              <_i11.TvSeriesModel>[])) as _i6.Future<List<_i11.TvSeriesModel>>);
  @override
  _i6.Future<_i3.TvSeriesDetailResponse> getTvSeriesDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesDetail, [id]),
              returnValue: Future<_i3.TvSeriesDetailResponse>.value(
                  _FakeTvSeriesDetailResponse_1()))
          as _i6.Future<_i3.TvSeriesDetailResponse>);
  @override
  _i6.Future<List<_i11.TvSeriesModel>> getTvSeriesRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesRecommendations, [id]),
          returnValue: Future<List<_i11.TvSeriesModel>>.value(
              <_i11.TvSeriesModel>[])) as _i6.Future<List<_i11.TvSeriesModel>>);
  @override
  _i6.Future<List<_i11.TvSeriesModel>> searchTvSeriess(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTvSeriess, [query]),
          returnValue: Future<List<_i11.TvSeriesModel>>.value(
              <_i11.TvSeriesModel>[])) as _i6.Future<List<_i11.TvSeriesModel>>);
}

/// A class which mocks [TvSeriesLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesLocalDataSource extends _i1.Mock
    implements _i12.TvSeriesLocalDataSource {
  MockTvSeriesLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchlist(_i13.TvSeriesTable? series) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [series]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<String> removeWatchlist(_i13.TvSeriesTable? series) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [series]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i13.TvSeriesTable?> getTvSeriesById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesById, [id]),
              returnValue: Future<_i13.TvSeriesTable?>.value())
          as _i6.Future<_i13.TvSeriesTable?>);
  @override
  _i6.Future<List<_i13.TvSeriesTable>> getWatchlistTvSeriess() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTvSeriess, []),
          returnValue: Future<List<_i13.TvSeriesTable>>.value(
              <_i13.TvSeriesTable>[])) as _i6.Future<List<_i13.TvSeriesTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i14.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i15.Database?> get database =>
      (super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<_i15.Database?>.value())
          as _i6.Future<_i15.Database?>);
  @override
  _i6.Future<int> insertWatchlist(_i16.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<int> insertWatchlistSeries(_i13.TvSeriesTable? series) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistSeries, [series]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlist(_i16.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlistSeries(_i13.TvSeriesTable? series) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistSeries, [series]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<Map<String, dynamic>?> getSeriesById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getSeriesById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i6.Future<List<Map<String, dynamic>>>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistSeries, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i6.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i17.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i17.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i17.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i17.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i18.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i18.Uint8List>.value(_i18.Uint8List(0)))
          as _i6.Future<_i18.Uint8List>);
  @override
  _i6.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3()))
          as _i6.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
