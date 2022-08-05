import 'package:core/core.dart';
import 'package:core/domain/entities/movie/movie.dart';
import 'package:dartz/dartz.dart';

class GetWatchlistMovies {
  final MovieRepository _repository;

  GetWatchlistMovies(this._repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return _repository.getWatchlistMovies();
  }
}
