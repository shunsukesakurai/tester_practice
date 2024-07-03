import 'package:flutter_test/flutter_test.dart';
import 'package:tester_practice/main.dart';

void main() {
  testWidgets('画面遷移のテスト', (WidgetTester tester) async {
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
  });
}
