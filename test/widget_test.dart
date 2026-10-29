import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rufus/main.dart';

void main() {
  testWidgets('Exibe a tela inicial do Rufus', (tester) async {
    await tester.pumpWidget(const MainApp());

    expect(find.text('Rufus'), findsOneWidget);
    expect(
      find.text('Gravador de imagens ISO — em desenvolvimento'),
      findsOneWidget,
    );
    expect(tester.widget<MaterialApp>(find.byType(MaterialApp)).title, 'Rufus');
    expect(tester.takeException(), isNull);
  });
}
