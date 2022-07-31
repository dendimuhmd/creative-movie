import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_series_state.dart';

class DetailSeriesCubit extends Cubit<DetailSeriesState> {
  DetailSeriesCubit() : super(DetailSeriesInitial());
}
