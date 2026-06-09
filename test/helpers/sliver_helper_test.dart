import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_ui_kit/app_ui_kit.dart';

Widget _buildApp(Widget sliverContent) {
  return MaterialApp(
    home: Scaffold(
      body: CustomScrollView(slivers: [sliverContent]),
    ),
  );
}

void main() {
  testWidgets('SliverHelper.fillRemaining renders', (tester) async {
    await tester.pumpWidget(_buildApp(
      SliverHelper.fillRemaining(child: const Text('Fill')),
    ));
    expect(find.text('Fill'), findsOneWidget);
  });

  testWidgets('SliverHelper.padded renders', (tester) async {
    await tester.pumpWidget(_buildApp(
      SliverHelper.padded(
        sliver: const SliverToBoxAdapter(child: Text('Padded')),
      ),
    ));
    expect(find.text('Padded'), findsOneWidget);
  });

  testWidgets('SliverHelper.scrollable renders', (tester) async {
    await tester.pumpWidget(_buildApp(
      SliverHelper.scrollable(
        child: const SizedBox(height: 100, child: Text('Scroll')),
      ),
    ));
    expect(find.text('Scroll'), findsOneWidget);
  });

  testWidgets('SliverHelper.separatedList renders', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverHelper.separatedList(
              itemCount: 3,
              itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
              separatorBuilder: (_, __) => const Divider(),
            ),
          ],
        ),
      ),
    ));
    expect(find.text('Item 0'), findsOneWidget);
    expect(find.text('Item 1'), findsOneWidget);
    expect(find.text('Item 2'), findsOneWidget);
  });

  testWidgets('SliverHelper.breadcrumb renders', (tester) async {
    await tester.pumpWidget(_buildApp(
      SliverHelper.breadcrumb([
        const Text('A'),
        const Text('B'),
      ]),
    ));
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
  });

  testWidgets('SliverHelper.fixedExtentList renders', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverHelper.fixedExtentList(
              itemCount: 2,
              itemExtent: 50,
              itemBuilder: (_, i) => Text('Fixed $i'),
            ),
          ],
        ),
      ),
    ));
    expect(find.text('Fixed 0'), findsOneWidget);
    expect(find.text('Fixed 1'), findsOneWidget);
  });
}
