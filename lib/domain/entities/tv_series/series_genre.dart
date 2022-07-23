import 'package:equatable/equatable.dart';

class SeriesGenre extends Equatable {
  SeriesGenre({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];
}
