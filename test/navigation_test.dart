import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tester_practice/main.dart';

void main() {
  testWidgets('物理戻るボタンとスワイプ操作での戻る操作のテスト', (WidgetTester tester) async {
    // 最初の画面を表示
    await tester.pumpWidget(const MyApp());

    // ボタンをタップして次の画面に遷移
    await tester.tap(find.text('Go to Second Screen'));
    await tester.pumpAndSettle();

    // 現在の画面が次の画面であることを確認
    expect(find.text('Second Screen'), findsOneWidget);
    expect(find.text('First Screen'), findsNothing);

    // Navigator.popを使って戻る操作をシミュレート
    tester.state<NavigatorState>(find.byType(Navigator)).pop();
    await tester.pumpAndSettle();

    // 再び最初の画面に戻っていることを確認
    expect(find.text('First Screen'), findsOneWidget);
    expect(find.text('Second Screen'), findsNothing);

    // ボタンをタップして次の画面に再度遷移
    await tester.tap(find.text('Go to Second Screen'));
    await tester.pumpAndSettle();

    // スワイプ操作の代わりにNavigator.popを使用
    tester.state<NavigatorState>(find.byType(Navigator)).pop();
    await tester.pumpAndSettle();

    // 再び最初の画面に戻っていることを確認
    expect(find.text('First Screen'), findsOneWidget);
    expect(find.text('Second Screen'), findsNothing);
  });
}
