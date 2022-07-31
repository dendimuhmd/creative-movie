import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'series_list_state.dart';

class SeriesListCubit extends Cubit<SeriesListState> {
  SeriesListCubit() : super(SeriesListInitial());
}
