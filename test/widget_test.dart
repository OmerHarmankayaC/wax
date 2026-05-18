import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:wax/main.dart';

void main() {
  testWidgets('App renders without error', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CollectionNotifier(),
        child: const WaxApp(),
      ),
    );
    expect(find.text('WAX'), findsWidgets);
  });
}
