import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tv_series/presentation/bloc/top_rated_series_bloc.dart';
import 'package:tv_series/presentation/pages/top_rated_series_page.dart';

import '../../dummy_data/tv_series/dummy_objects.dart';

class TopRatedSeriesEventFake extends Fake implements TopRatedSeriesEvent {}

class TopRatedSeriesStateFake extends Fake implements TopRatedSeriesState {}

class MockTopRatedSeriesBloc
    extends MockBloc<TopRatedSeriesEvent, TopRatedSeriesState>
    implements TopRatedSeriesBloc {}

void main() {
  late MockTopRatedSeriesBloc mockTopRatedSeriesBloc;

  setUpAll(() {
    registerFallbackValue(TopRatedSeriesEventFake());
    registerFallbackValue(TopRatedSeriesStateFake());
  });

  setUp(() {
    mockTopRatedSeriesBloc = MockTopRatedSeriesBloc();
  });

  Widget _body(Widget body) {
    return BlocProvider<TopRatedSeriesBloc>.value(
      value: mockTopRatedSeriesBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockTopRatedSeriesBloc.state)
        .thenReturn(TopRatedSeriesLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_body(TopRatedSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockTopRatedSeriesBloc.state)
        .thenReturn(TopRatedSeriesLoaded([testTvSeries]));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_body(TopRatedSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Empty',
      (WidgetTester tester) async {
    when(() => mockTopRatedSeriesBloc.state).thenReturn(TopRatedSeriesEmpty());

    final textFinder = find.text('Empty Top Rated Series');

    await tester.pumpWidget(_body(TopRatedSeriesPage()));

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockTopRatedSeriesBloc.state)
        .thenReturn(TopRatedSeriesError('Failed'));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_body(TopRatedSeriesPage()));

    expect(textFinder, findsOneWidget);
  });
}
