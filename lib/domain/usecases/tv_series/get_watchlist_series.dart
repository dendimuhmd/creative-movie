import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/movir/movir.dart';
import 'package:ditonton/domain/repositories/movir_repository.dart';
import 'package:ditonton/common/failure.dart';

class GetWatchlistMovies {
  final MovieRepository _repository;

  GetWatchlistMovies(this._repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return _repository.getWatchlistMovies();
  }
}
