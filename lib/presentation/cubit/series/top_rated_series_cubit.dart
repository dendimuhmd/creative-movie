import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_series_state.dart';

class TopRatedSeriesCubit extends Cubit<TopRatedSeriesState> {
  TopRatedSeriesCubit() : super(TopRatedSeriesInitial());
}
