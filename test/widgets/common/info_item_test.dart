import 'package:country/widgets/common/info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InfoItem', () {
    testWidgets('should have correctly render 2 text widget', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: InfoItem(label: 'height', value: '180cm'),
        ),
      ));

      expect(find.byType(Text), findsNWidgets(2));
      expect(find.text('height'), findsOneWidget);
      expect(find.text('180cm'), findsOneWidget);
    });
  });
}
