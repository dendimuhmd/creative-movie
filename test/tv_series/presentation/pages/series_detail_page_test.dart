import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series/series.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';

import 'package:tv_series/presentation/bloc/series_detail_bloc.dart';
import 'package:tv_series/presentation/pages/series_detail_page.dart';

import '../../../core/dummy_data/tv_series/dummy_objects.dart';

class SeriesDetailEventFake extends Fake implements SeriesDetailEvent {}

class SeriesDetailStateFake extends Fake implements SeriesDetailState {}

class MockSeriesDetailBloc
    extends MockBloc<SeriesDetailEvent, SeriesDetailState>
    implements SeriesDetailBloc {}

void main() {
  late MockSeriesDetailBloc mockSeriesDetailBloc;

  setUpAll(() {
    registerFallbackValue(SeriesDetailEventFake());
    registerFallbackValue(SeriesDetailStateFake());
  });

  setUp(() {
    mockSeriesDetailBloc = MockSeriesDetailBloc();
  });

  Widget _body(Widget body) {
    return BlocProvider<SeriesDetailBloc>.value(
      value: mockSeriesDetailBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Detail TvSeries Page should display Progressbar when loading',
      (WidgetTester tester) async {
    when(() => mockSeriesDetailBloc.state).thenReturn(
        SeriesDetailState.initial()
            .copyWith(tvSeriesDetailState: RequestState.Loading));

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_body(TvSeriesDetailPage(id: 1)));

    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('should display loading when recommendationState loading',
      (WidgetTester tester) async {
    when(() => mockSeriesDetailBloc.state)
        .thenReturn(SeriesDetailState.initial().copyWith(
      tvSeriesDetailState: RequestState.Loaded,
      tvSeriesDetail: testTvSeriesDetail,
      tvSeriesState: RequestState.Loading,
      tvSeries: <TvSeries>[],
      isAddedToWatchlist: false,
    ));

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_body(TvSeriesDetailPage(id: 1)));

    expect(progressBarFinder, findsWidgets);
  });

  testWidgets(
      'Watchlist button should display add icon when series not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockSeriesDetailBloc.state)
        .thenReturn(SeriesDetailState.initial().copyWith(
      tvSeriesDetailState: RequestState.Loaded,
      tvSeriesDetail: testTvSeriesDetail,
      tvSeriesState: RequestState.Loaded,
      tvSeries: [testTvSeries],
      isAddedToWatchlist: false,
    ));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_body(TvSeriesDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when series is added to wathclist',
      (WidgetTester tester) async {
    when(() => mockSeriesDetailBloc.state)
        .thenReturn(SeriesDetailState.initial().copyWith(
      tvSeriesDetailState: RequestState.Loaded,
      tvSeriesDetail: testTvSeriesDetail,
      tvSeriesState: RequestState.Loaded,
      tvSeries: [testTvSeries],
      isAddedToWatchlist: true,
    ));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_body(TvSeriesDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    whenListen(
        mockSeriesDetailBloc,
        Stream.fromIterable([
          SeriesDetailState.initial().copyWith(
            tvSeriesDetailState: RequestState.Loaded,
            tvSeriesDetail: testTvSeriesDetail,
            tvSeriesState: RequestState.Loaded,
            tvSeries: [testTvSeries],
            isAddedToWatchlist: false,
          ),
          SeriesDetailState.initial().copyWith(
            tvSeriesDetailState: RequestState.Loaded,
            tvSeriesDetail: testTvSeriesDetail,
            tvSeriesState: RequestState.Loaded,
            tvSeries: [testTvSeries],
            isAddedToWatchlist: false,
            watchlistMessage: 'Added to Watchlist',
          ),
        ]),
        initialState: SeriesDetailState.initial());

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_body(TvSeriesDetailPage(id: 1)));
    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when removed from watchlist',
      (WidgetTester tester) async {
    whenListen(
        mockSeriesDetailBloc,
        Stream.fromIterable([
          SeriesDetailState.initial().copyWith(
            tvSeriesDetailState: RequestState.Loaded,
            tvSeriesDetail: testTvSeriesDetail,
            tvSeriesState: RequestState.Loaded,
            tvSeries: [testTvSeries],
            isAddedToWatchlist: false,
          ),
          SeriesDetailState.initial().copyWith(
            tvSeriesDetailState: RequestState.Loaded,
            tvSeriesDetail: testTvSeriesDetail,
            tvSeriesState: RequestState.Loaded,
            tvSeries: [testTvSeries],
            isAddedToWatchlist: false,
            watchlistMessage: 'Removed from Watchlist',
          ),
        ]),
        initialState: SeriesDetailState.initial());

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_body(TvSeriesDetailPage(id: 1)));
    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Removed from Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    whenListen(
        mockSeriesDetailBloc,
        Stream.fromIterable([
          SeriesDetailState.initial().copyWith(
            tvSeriesDetailState: RequestState.Loaded,
            tvSeriesDetail: testTvSeriesDetail,
            tvSeriesState: RequestState.Loaded,
            tvSeries: [testTvSeries],
            isAddedToWatchlist: false,
          ),
          SeriesDetailState.initial().copyWith(
            tvSeriesDetailState: RequestState.Loaded,
            tvSeriesDetail: testTvSeriesDetail,
            tvSeriesState: RequestState.Loaded,
            tvSeries: [testTvSeries],
            isAddedToWatchlist: false,
            watchlistMessage: 'Failed',
          ),
          SeriesDetailState.initial().copyWith(
            tvSeriesDetailState: RequestState.Loaded,
            tvSeriesDetail: testTvSeriesDetail,
            tvSeriesState: RequestState.Loaded,
            tvSeries: [testTvSeries],
            isAddedToWatchlist: false,
            watchlistMessage: 'Failed ',
          ),
        ]),
        initialState: SeriesDetailState.initial());

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_body(TvSeriesDetailPage(id: 1)));
    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton, warnIfMissed: false);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });

  testWidgets(
      'Detail TvSeries Page should display Error Text when No Internet Network (Error)',
      (WidgetTester tester) async {
    when(() => mockSeriesDetailBloc.state).thenReturn(
        SeriesDetailState.initial().copyWith(
            tvSeriesDetailState: RequestState.Error,
            message: 'Failed to connect to the network'));

    final textErrorBarFinder = find.text('Failed to connect to the network');

    await tester.pumpWidget(_body(TvSeriesDetailPage(id: 1)));
    await tester.pump();

    expect(textErrorBarFinder, findsOneWidget);
  });
}
