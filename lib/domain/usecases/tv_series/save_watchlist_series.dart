import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/movir/movir_detail.dart';
import 'package:ditonton/domain/repositories/movir_repository.dart';

class SaveWatchlist {
  final MovieRepository repository;

  SaveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movir) {
    return repository.saveWatchlist(movir);
  }
}
