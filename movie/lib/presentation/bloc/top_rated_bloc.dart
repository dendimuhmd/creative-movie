import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/movie/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/usecases/get_top_rated_movies.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedEvent, TopRatedState> {
  final GetTopRatedMovies getTopRated;
  TopRatedMovieBloc(this.getTopRated) : super(TopRatedEmpty()) {
    on<TopRatedEvent>((event, emit) async {
      emit(TopRatedLoading());
      final result = await getTopRated.execute();
      result.fold(
        (failure) => emit(TopRatedError(failure.message)),
        (moviesData) {
          emit(TopRatedLoaded(moviesData));
          if (moviesData.isEmpty) {
            emit(TopRatedEmpty());
          }
        },
      );
    });
  }
}
