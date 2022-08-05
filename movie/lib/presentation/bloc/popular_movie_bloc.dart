import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/usecases/get_popular_movies.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMoviesBloc extends Bloc<PopularMovieEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;
  PopularMoviesBloc(this.getPopularMovies) : super(PopularMoviesEmpty()) {
    on<PopularMovieEvent>((event, emit) async {
      emit(PopularMoviesLoading());
      final result = await getPopularMovies.execute();
      result.fold(
        (failure) => emit(PopularMoviesError(failure.message)),
        (moviesData) {
          emit(PopularMoviesLoaded(moviesData));
          if (moviesData.isEmpty) {
            emit(PopularMoviesEmpty());
          }
        },
      );
    });
  }
}
