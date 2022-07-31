import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_series_state.dart';

class SearchSeriesCubit extends Cubit<SearchSeriesState> {
  SearchSeriesCubit() : super(SearchSeriesInitial());
}
