import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'popular_series_state.dart';

class PopularSeriesCubit extends Cubit<PopularSeriesState> {
  PopularSeriesCubit() : super(PopularSeriesInitial());
}
