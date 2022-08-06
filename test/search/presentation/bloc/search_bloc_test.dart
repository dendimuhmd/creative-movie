import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/movie/movie.dart';
import 'package:core/domain/entities/tv_series/series.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/domain/usecases/search_movies.dart';
import 'package:search/domain/usecases/search_series.dart';
import 'package:search/presentation/bloc/search_bloc.dart';

import '../../../core/dummy_data/movie/dummy_objects.dart';
import 'search_bloc_test.mocks.dart';

@GenerateMocks([SearchMovies, SearchTvSeriess])
void main() {
  late SearchMovieBloc searchMovieBloc;
  late SearchTvSeriesBloc searchTvSeriesBloc;
  late MockSearchMovies mockSearchMovies;
  late MockSearchTvSeriess mockSearchTvSeriess;

  // setUp(() {
  //   searchTvSeriesBloc = SearchTvSeriesBloc(mockSearchTvSeriess);
  //   mockSearchMovies = MockSearchMovies();
  //   searchMovieBloc = SearchMovieBloc(mockSearchMovies);
  //   mockSearchTvSeriess = MockSearchTvSeriess();
  // });

  setUp(() {
    mockSearchTvSeriess = MockSearchTvSeriess();
    mockSearchMovies = MockSearchMovies();
    searchTvSeriesBloc = SearchTvSeriesBloc(mockSearchTvSeriess);
    searchMovieBloc = SearchMovieBloc(mockSearchMovies);
  });

  final tTvSeriesModel = TvSeries(
      originalName: "2 Good 2 Be True",
      posterPath: "/2Wf5ySCPcnp8lRhbSD7jt0YLz5A.jpg",
      id: 135647,
      overview:
          "Car mechanic Eloy makes a terrible first impression on Ali, who works for a real estate magnate. But both of them are hiding their true personas.",
      popularity: 943.32,
      genreIds: [35, 18],
      backdropPath: "/sIRK4NYe1OK2hOJAg4xxuxzceKk.jpg",
      voteAverage: 7.5,
      voteCount: 102);
  final tTvSeriesList = <TvSeries>[tTvSeriesModel];
  final tQuery = 'spiderman';

  group('Search Movies', () {
    test('Initial state should be empty', () {
      expect(searchMovieBloc.state, SearchEmpty(''));
    });

    blocTest<SearchMovieBloc, SearchState>(
      'Should emit [SearchLoading, SearchHasData] when data is gotten successfully',
      build: () {
        when(mockSearchMovies.execute(tQuery))
            .thenAnswer((_) async => Right(testMovieList));
        return searchMovieBloc;
      },
      act: (bloc) => bloc.add(OnQueryChanged(tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchLoading(),
        SearchHasData(testMovieList),
      ],
      verify: (bloc) {
        verify(mockSearchMovies.execute(tQuery));
      },
    );

    blocTest<SearchMovieBloc, SearchState>(
      'Should emit [SearchLoading, SearchHasData[], SearchEmpty] when data is empty',
      build: () {
        when(mockSearchMovies.execute(tQuery))
            .thenAnswer((_) async => Right(<Movie>[]));
        return searchMovieBloc;
      },
      act: (bloc) => bloc.add(OnQueryChanged(tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchLoading(),
        SearchHasData(<Movie>[]),
        SearchEmpty('No Result Found'),
      ],
      verify: (bloc) {
        verify(mockSearchMovies.execute(tQuery));
      },
    );

    blocTest<SearchMovieBloc, SearchState>(
      'Should emit [SearchLoading, SearchError] when data is unsuccessful',
      build: () {
        when(mockSearchMovies.execute(tQuery))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
        return searchMovieBloc;
      },
      act: (bloc) => bloc.add(OnQueryChanged(tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchLoading(),
        SearchError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockSearchMovies.execute(tQuery));
      },
    );
  }

      // final tTvShowModel = TvSeries(
      //   backdropPath: "/xAKMj134XHQVNHLC6rWsccLMenG.jpg",
      //   genreIds: [10765, 35, 80],
      //   id: 90462,
      //     originalName: "Chucky",
      //     overview:
      //         "After a vintage Chucky doll turns up at a suburban yard sale, an idyllic American town is thrown into chaos as a series of horrifying murders begin to expose the town’s hypocrisies and secrets. Meanwhile, the arrival of enemies — and allies — from Chucky’s past threatens to expose the truth behind the killings, as well as the demon doll’s untold origins.",
      //     popularity: 6008.272,
      //     posterPath: "/iF8ai2QLNiHV4anwY1TuSGZXqfN.jpg",
      //     voteAverage: 8,
      //     voteCount: 987);
      // final tTvShowList = <TvSeries>[tTvShowModel];
      // final tQueryTvShow = 'chucky';

      // group('Search Tv Shows', () {
      //   test('Initial state should be empty', () {
      //     expect(searchTvShowBloc.state, SearchEmpty(''));
      //   });

      //   blocTest<SearchTvShowBloc, SearchState>(
      //     'Should emit [SearchLoading, SearchHasData] when data is gotten successfully',
      //     build: () {
      //       when(mockSearchTvShows.execute(tQueryTvShow))
      //           .thenAnswer((_) async => Right(tTvShowList));
      //       return searchTvShowBloc;
      //     },
      //     act: (bloc) => bloc.add(OnQueryChanged(tQueryTvShow)),
      //     wait: const Duration(milliseconds: 500),
      //     expect: () => [
      //       SearchLoading(),
      //       SearchHasData(tTvShowList),
      //     ],
      //     verify: (bloc) {
      //       verify(mockSearchTvShows.execute(tQueryTvShow));
      //     },
      //   );

      //   blocTest<SearchTvShowBloc, SearchState>(
      //     'Should emit [SearchLoading, SearchHasData[], SearchEmpty] when data is empty',
      //     build: () {
      //       when(mockSearchTvShows.execute(tQueryTvShow))
      //           .thenAnswer((_) async => Right(<TvShow>[]));
      //       return searchTvShowBloc;
      //     },
      //     act: (bloc) => bloc.add(OnQueryChanged(tQueryTvShow)),
      //     wait: const Duration(milliseconds: 500),
      //     expect: () => [
      //       SearchLoading(),
      //       SearchHasData(<TvShow>[]),
      //       SearchEmpty('No Result Found'),
      //     ],
      //     verify: (bloc) {
      //       verify(mockSearchTvShows.execute(tQueryTvShow));
      //     },
      //   );

      //   blocTest<SearchTvShowBloc, SearchState>(
      //     'Should emit [SearchLoading, SearchError] when data is unsuccessful',
      //     build: () {
      //       when(mockSearchTvShows.execute(tQueryTvShow))
      //           .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      //       return searchTvShowBloc;
      //     },
      //     act: (bloc) => bloc.add(OnQueryChanged(tQueryTvShow)),
      //     wait: const Duration(milliseconds: 500),
      //     expect: () => [
      //       SearchLoading(),
      //       SearchError('Server Failure'),
      //     ],
      //     verify: (bloc) {
      //       verify(mockSearchTvShows.execute(tQueryTvShow));
      //     },
      //   );
      // });
      );
}
