import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_scores/widgets/logo.dart';

Widget createWidgetForTesting({Widget child}) {
  return MaterialApp(
    home: child,
  );
}

void main() {
  testWidgets('AppLogo should have right title and icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: AppLogo()));

    final titleFinder = find.text('Football Scores');
    final iconFinder = find.byIcon(Icons.sports_soccer);

    expect(titleFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
  });

  testWidgets('AppLogo should have Row widget', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: AppLogo()));

    final rowFinder = find.byType(Row);

    expect(rowFinder, findsOneWidget);
  });
}
