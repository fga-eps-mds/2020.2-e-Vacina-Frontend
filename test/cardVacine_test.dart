import 'package:flutter_test/flutter_test.dart';
import 'package:e_vacina/component/CardVaccine.dart';
import 'package:flutter/material.dart';


void main() {
  testWidgets('Card vacinas', (WidgetTester tester) async {
    
    await tester.pumpWidget(
        Directionality(
          textDirection:TextDirection.ltr,
        child:  
        buildVaccineCard('title', 'subtitle')
      )
    );
    expect(find.text('title'), findsOneWidget);
    expect(find.text('subtitle'), findsOneWidget);
  });
  
}
