import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/entities/movie/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/usecases/get_top_rated_movies.dart';
import 'package:movie/presentation/bloc/top_rated_bloc.dart';

import 'top_rated_movies_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late TopRatedMovieBloc topRatedBloc;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    topRatedBloc = TopRatedMovieBloc(mockGetTopRatedMovies);
  });

  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  final tMovieList = <Movie>[tMovie];

  group('TopRated Movies', () {
    test('Initial state should be empty', () {
      expect(topRatedBloc.state, TopRatedEmpty());
    });

    blocTest<TopRatedMovieBloc, TopRatedState>(
      'Should emit [TopRatedLoading, TopRatedLoaded] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => Right(tMovieList));
        return topRatedBloc;
      },
      act: (bloc) => bloc.add(TopRatedEvent()),
      expect: () => [
        TopRatedLoading(),
        TopRatedLoaded(tMovieList),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedMovies.execute());
      },
    );

    blocTest<TopRatedMovieBloc, TopRatedState>(
      'Should emit [TopRatedLoading, TopRatedLoaded[], TopRatedEmpty] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => Right(<Movie>[]));
        return topRatedBloc;
      },
      act: (bloc) => bloc.add(TopRatedEvent()),
      expect: () => [
        TopRatedLoading(),
        TopRatedLoaded(<Movie>[]),
        TopRatedEmpty(),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedMovies.execute());
      },
    );

    blocTest<TopRatedMovieBloc, TopRatedState>(
      'Should emit [TopRatedLoading, TopRatedMoviesError] when get Failure',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => Left(ServerFailure('Failed')));
        return topRatedBloc;
      },
      act: (bloc) => bloc.add(TopRatedEvent()),
      expect: () => [
        TopRatedLoading(),
        TopRatedError('Failed'),
      ],
      verify: (_) {
        verify(mockGetTopRatedMovies.execute());
      },
    );
  });
}
