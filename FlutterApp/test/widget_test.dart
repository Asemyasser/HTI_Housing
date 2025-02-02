import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gradproject/main.dart';  // تأكد من أن مسار هذا الملف صحيح

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // بناء التطبيق وتحفيز الإطار مع تجاوز Firebase
    await tester.pumpWidget(MyApp());  // لا يمكن استخدام const هنا بسبب التهيئة

    // التحقق من أن العداد يبدأ من 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // النقر على الأيقونة '+' وتحفيز الإطار
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // التحقق من أن العداد قد ازداد
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
