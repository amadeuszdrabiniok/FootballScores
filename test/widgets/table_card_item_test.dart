import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_scores/widgets/table_card_item.dart';

Widget createWidgetForTesting({Widget child}) {
  return MaterialApp(
    home: child,
  );
}

void main() {
  testWidgets('Card item should have label and value',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createWidgetForTesting(child: TableCardItem('testLabel', 'testValue')));

    final labelFinder = find.text('testLabel');
    final valueFinder = find.text('testValue');

    expect(labelFinder, findsOneWidget);
    expect(valueFinder, findsOneWidget);
  });

  group('Divider tests', () {
    testWidgets('Divider should be created', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetForTesting(
          child: TableCardItem('testLabel', 'testValue')));

      final dividerFinder = find.byType(Divider);

      expect(dividerFinder, findsOneWidget);
    });

    testWidgets('Divider should have right color', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetForTesting(
          child: TableCardItem('testLabel', 'testValue')));

      expect((tester.firstWidget(find.byType(Divider)) as Divider).color,
          Colors.black);
    });
  });
}
