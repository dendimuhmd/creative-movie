import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/presentation/bloc/popular_series_bloc.dart';
import 'package:tv_series/presentation/pages/popular_series_page.dart';

import '../../../core/dummy_data/tv_series/dummy_objects.dart';

class PopularSeriesEventFake extends Fake implements PopularSeriesEvent {}

class PopularSeriesStateFake extends Fake implements PopularTvSeriesState {}

class MockPopularSeriesBloc
    extends MockBloc<PopularSeriesEvent, PopularTvSeriesState>
    implements PopularSeriesBloc {}

void main() {
  late MockPopularSeriesBloc mockPopularSeriesBloc;

  setUpAll(() {
    registerFallbackValue(PopularSeriesEventFake());
    registerFallbackValue(PopularSeriesStateFake());
  });

  setUp(() {
    mockPopularSeriesBloc = MockPopularSeriesBloc();
  });

  Widget _body(Widget body) {
    return BlocProvider<PopularSeriesBloc>.value(
      value: mockPopularSeriesBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockPopularSeriesBloc.state)
        .thenReturn(PopularTvSeriesLoading());

    final showLoadingWidget = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_body(PopularSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(showLoadingWidget, findsOneWidget);
  });

  testWidgets('Show ListView when state is load', (WidgetTester tester) async {
    when(() => mockPopularSeriesBloc.state)
        .thenReturn(PopularTvSeriesLoaded([testTvSeries]));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_body(PopularSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Show text with message when state is Empty',
      (WidgetTester tester) async {
    when(() => mockPopularSeriesBloc.state).thenReturn(PopularTvSeriesEmpty());

    final textFinder = find.text('Empty Popular Tv Series');

    await tester.pumpWidget(_body(PopularSeriesPage()));

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Show text with message when  state is Error',
      (WidgetTester tester) async {
    when(() => mockPopularSeriesBloc.state)
        .thenReturn(PopularTvSeriesError('Failed'));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_body(PopularSeriesPage()));

    expect(textFinder, findsOneWidget);
  });
}
