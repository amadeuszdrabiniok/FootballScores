import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_scores/widgets/football_app_bar.dart';

Widget createWidgetForTesting({Widget child}) {
  return MaterialApp(
    home: child,
  );
}

void main() {
  testWidgets('FootbalAppBar should have right title and icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: FootballAppBar()));

    final titleFinder = find.text('Football Scores');
    final iconFinder = find.byIcon(Icons.sports_soccer);

    expect(titleFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
  });

  testWidgets('FootbalAppBar should have black color',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: FootballAppBar()));

    expect((tester.firstWidget(find.byType(AppBar)) as AppBar).backgroundColor,
        Colors.black);
  });
}
