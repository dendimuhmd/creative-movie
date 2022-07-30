import 'dart:convert';

import 'package:ditonton/data/datasources/tv_series/series_remote_data_source.dart';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/tv_series/series_detail_model.dart';

import 'package:ditonton/data/models/tv_series/series_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';
import '../../../json_reader.dart';
import 'series_remote_data_source_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<TvSeriesRemoteDataSourceImpl>(returnNullOnMissingStub: true)
])
void main() {
  const API_KEY = 'api_key=b0667c4054e7d1f4b4ca0c708d2aac8f';
  const BASE_URL = 'https://api.themoviedb.org/3/';

  late TvSeriesRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = TvSeriesRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get Now Playing TvSeriess', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(json
            .decode(readJson('tv_series/dummy_data_series/now_playing.json')))
        .tvSerieslist;

    test('should return list of TvSeries Model when the response code is 200',
        () async {
      var a = MockTvSeriesRemoteDataSourceImpl();
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
          .thenAnswer((_) async => http.Response(
              readJson('tv_series/dummy_data_series/now_playing.json'), 200));
      // act
      final result = await dataSource.getNowPlayingTvSeriess();
      // assert
      expect(result, equals(tTvSeriesList));
      verify(await dataSource.getNowPlayingTvSeriess());
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getNowPlayingTvSeriess();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  // group('get Popular TvSeriess', () {
  //   final tTvSeriesList = TvSeriesResponse.fromJson(
  //           json.decode(readJson('dummy_data/popular.json')))
  //       .tvSerieslist;

  //   test('should return list of movies when response is success (200)',
  //       () async {
  //     // arrange
  //     when(mockHttpClient.get(Uri.parse('$BASE_URL/movie/popular?$API_KEY')))
  //         .thenAnswer((_) async =>
  //             http.Response(readJson('dummy_data/popular.json'), 200));
  //     // act
  //     final result = await dataSource.getPopularTvSeriess();
  //     // assert
  //     expect(result, tTvSeriesList);
  //   });

  //   test(
  //       'should throw a ServerException when the response code is 404 or other',
  //       () async {
  //     // arrange
  //     when(mockHttpClient.get(Uri.parse('$BASE_URL/movie/popular?$API_KEY')))
  //         .thenAnswer((_) async => http.Response('Not Found', 404));
  //     // act
  //     final call = dataSource.getPopularTvSeriess();
  //     // assert
  //     expect(() => call, throwsA(isA<ServerException>()));
  //   });
  // });

  // group('get Top Rated TvSeriess', () {
  //   final tTvSeriesList = TvSeriesResponse.fromJson(
  //           json.decode(readJson('dummy_data/top_rated.json')))
  //       .tvSerieslist;

  //   test('should return list of movies when response code is 200 ', () async {
  //     // arrange
  //     when(mockHttpClient.get(Uri.parse('$BASE_URL/movie/top_rated?$API_KEY')))
  //         .thenAnswer((_) async =>
  //             http.Response(readJson('dummy_data/top_rated.json'), 200));
  //     // act
  //     final result = await dataSource.getTopRatedTvSeriess();
  //     // assert
  //     expect(result, tTvSeriesList);
  //   });

  //   test('should throw ServerException when response code is other than 200',
  //       () async {
  //     // arrange
  //     when(mockHttpClient.get(Uri.parse('$BASE_URL/movie/top_rated?$API_KEY')))
  //         .thenAnswer((_) async => http.Response('Not Found', 404));
  //     // act
  //     final call = dataSource.getTopRatedTvSeriess();
  //     // assert
  //     expect(() => call, throwsA(isA<ServerException>()));
  //   });
  // });

  // group('get movie detail', () {
  //   final tId = 1;
  //   final tTvSeriesDetail = TvSeriesDetailResponse.fromJson(
  //       json.decode(readJson('dummy_data/movie_detail.json')));

  //   test('should return movie detail when the response code is 200', () async {
  //     // arrange
  //     when(mockHttpClient.get(Uri.parse('$BASE_URL/movie/$tId?$API_KEY')))
  //         .thenAnswer((_) async =>
  //             http.Response(readJson('dummy_data/movie_detail.json'), 200));
  //     // act
  //     final result = await dataSource.getTvSeriesDetail(tId);
  //     // assert
  //     expect(result, equals(tTvSeriesDetail));
  //   });

  //   test('should throw Server Exception when the response code is 404 or other',
  //       () async {
  //     // arrange
  //     when(mockHttpClient.get(Uri.parse('$BASE_URL/movie/$tId?$API_KEY')))
  //         .thenAnswer((_) async => http.Response('Not Found', 404));
  //     // act
  //     final call = dataSource.getTvSeriesDetail(tId);
  //     // assert
  //     expect(() => call, throwsA(isA<ServerException>()));
  //   });
  // });

  // group('get movie recommendations', () {
  //   final tTvSeriesList = TvSeriesResponse.fromJson(
  //           json.decode(readJson('dummy_data/movie_recommendations.json')))
  //       .tvSerieslist;
  //   final tId = 1;

  //   test('should return list of TvSeries Model when the response code is 200',
  //       () async {
  //     // arrange
  //     when(mockHttpClient
  //             .get(Uri.parse('$BASE_URL/movie/$tId/recommendations?$API_KEY')))
  //         .thenAnswer((_) async => http.Response(
  //             readJson('dummy_data/movie_recommendations.json'), 200));
  //     // act
  //     final result = await dataSource.getTvSeriesRecommendations(tId);
  //     // assert
  //     expect(result, equals(tTvSeriesList));
  //   });

  //   test('should throw Server Exception when the response code is 404 or other',
  //       () async {
  //     // arrange
  //     when(mockHttpClient
  //             .get(Uri.parse('$BASE_URL/movie/$tId/recommendations?$API_KEY')))
  //         .thenAnswer((_) async => http.Response('Not Found', 404));
  //     // act
  //     final call = dataSource.getTvSeriesRecommendations(tId);
  //     // assert
  //     expect(() => call, throwsA(isA<ServerException>()));
  //   });
  // });

  // group('search movies', () {
  //   final tSearchResult = TvSeriesResponse.fromJson(
  //           json.decode(readJson('dummy_data/search_spiderman_movie.json')))
  //       .tvSerieslist;
  //   final tQuery = 'Spiderman';

  //   test('should return list of movies when response code is 200', () async {
  //     // arrange
  //     when(mockHttpClient
  //             .get(Uri.parse('$BASE_URL/search/movie?$API_KEY&query=$tQuery')))
  //         .thenAnswer((_) async => http.Response(
  //             readJson('dummy_data/search_spiderman_movie.json'), 200));
  //     // act
  //     final result = await dataSource.searchTvSeriess(tQuery);
  //     // assert
  //     expect(result, tSearchResult);
  //   });

  //   test('should throw ServerException when response code is other than 200',
  //       () async {
  //     // arrange
  //     when(mockHttpClient
  //             .get(Uri.parse('$BASE_URL/search/movie?$API_KEY&query=$tQuery')))
  //         .thenAnswer((_) async => http.Response('Not Found', 404));
  //     // act
  //     final call = dataSource.searchTvSeriess(tQuery);
  //     // assert
  //     expect(() => call, throwsA(isA<ServerException>()));
  //   });
  // });
}