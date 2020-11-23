// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:widget_test/Album.dart';
import 'package:widget_test/AlbumPage.dart';
import 'package:widget_test/MyProvider.dart';
import 'package:widget_test/MyRepository.dart';

import 'package:widget_test/main.dart';

class MockRepository  extends Mock implements CounterRepository{}
void main() {
  testWidgets('Counter increments smoke test with Provider', (WidgetTester tester) async {
    // Build our app and trigger a frame.
   var counterRepository = MockRepository();
   when(counterRepository.increment(0)).thenReturn(1);

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(create: (context) => CounterProvider(counterRepository))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    ));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Test provider with network call',(WidgetTester tester) async {
    var repository = MockRepository();
    when(repository.loadAlbum()).thenAnswer((realInvocation) async => Album(userId: 1,id: 1,title: 'Good Bye'));

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(create: (context) => CounterProvider(repository))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AlbumPage()
      ),
    ));

    // Verify that our counter starts at 0.
    expect(find.text('Hello'), findsOneWidget);
    expect(find.text('Good Bye'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.network_check));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Hello'), findsNothing);
    expect(find.text('Good Bye'), findsOneWidget);

  });
}
