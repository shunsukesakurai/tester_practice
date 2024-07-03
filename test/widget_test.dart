// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tester_practice/main.dart';

void main() {
  testWidgets('画面遷移と戻る操作のテスト', (WidgetTester tester) async {
    // 最初の画面を表示
    await tester.pumpWidget(const MyApp());

    // 現在の画面が最初の画面であることを確認
    expect(find.text('First Screen'), findsOneWidget);
    expect(find.text('Second Screen'), findsNothing);

    // ボタンをタップして次の画面に遷移
    await tester.tap(find.text('Go to Second Screen'));
    await tester.pumpAndSettle();

    // 現在の画面が次の画面であることを確認
    expect(find.text('Second Screen'), findsOneWidget);
    expect(find.text('First Screen'), findsNothing);

    // 戻るボタンをタップして前の画面に戻る
    await tester.tap(find.text('Back to First Screen'));
    await tester.pumpAndSettle();

    // 再び最初の画面に戻っていることを確認
    expect(find.text('First Screen'), findsOneWidget);
    expect(find.text('Second Screen'), findsNothing);
  });
}
