import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_scores/widgets/go_button.dart';

Widget createWidgetForTesting({Widget child}) {
  return MaterialApp(
    home: child,
  );
}

void main() {
  testWidgets('Button should have label', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(
        child: GoButton(label: 'testLabel', onPressed: () {})));

    final titleFinder = find.text('testLabel');

    expect(titleFinder, findsOneWidget);
  });
}
