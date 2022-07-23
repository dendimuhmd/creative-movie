import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/movir/movir.dart';
import 'package:ditonton/domain/repositories/movir_repository.dart';
import 'package:ditonton/common/failure.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlayingMovies();
  }
}
