import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_scores/widgets/table_card.dart';
import 'package:football_scores/widgets/table_card_item.dart';

Widget createWidgetForTesting({Widget child}) {
  return MaterialApp(
    home: child,
  );
}

void main() {
  final List<TableCardItem> testItems = [
    TableCardItem('testLabel', 'testValue'),
  ];
  final String testTitle = 'testTitle';

  testWidgets('Table card should have title', (WidgetTester tester) async {
    await tester.pumpWidget(
      createWidgetForTesting(
        child: TableCard(
          tableCardItems: testItems,
          title: testTitle,
        ),
      ),
    );

    final titleFinder = find.text('testTitle');

    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Table card should have list item', (WidgetTester tester) async {
    await tester.pumpWidget(
      createWidgetForTesting(
        child: TableCard(
          tableCardItems: testItems,
          title: testTitle,
        ),
      ),
    );

    final labelFinder = find.text('testLabel');
    final valueFinder = find.text('testValue');

    expect(labelFinder, findsOneWidget);
    expect(valueFinder, findsOneWidget);
  });
}
