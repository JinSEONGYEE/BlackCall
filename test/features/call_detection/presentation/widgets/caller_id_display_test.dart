import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voice_phishing_app/features/call_detection/domain/entities/caller_info.dart';
import 'package:voice_phishing_app/features/call_detection/presentation/widgets/caller_id_display.dart';

void main() {
  group('CallerIdDisplay', () {
    testWidgets('should display formatted phone number', (tester) async {
      // Arrange
      const callerInfo = CallerInfo(
        phoneNumber: '+821012345678',
        formattedNumber: '+82-10-1234-5678',
        isPrivate: false,
        isKorean: true,
      );

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CallerIdDisplay(callerInfo: callerInfo),
          ),
        ),
      );

      // Assert
      expect(find.text('+82-10-1234-5678'), findsOneWidget);
      expect(find.text('Incoming Call'), findsOneWidget);
      expect(find.text('Korean Number'), findsOneWidget);
    });

    testWidgets('should display "Private Number" for private caller',
        (tester) async {
      // Arrange
      const callerInfo = CallerInfo(
        phoneNumber: '',
        formattedNumber: 'Private Number',
        isPrivate: true,
      );

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CallerIdDisplay(callerInfo: callerInfo),
          ),
        ),
      );

      // Assert
      expect(find.text('Private Number'), findsOneWidget);
      expect(find.byIcon(Icons.block), findsOneWidget);
      expect(find.text('Korean Number'), findsNothing);
    });

    testWidgets('should display international badge for international number',
        (tester) async {
      // Arrange
      const callerInfo = CallerInfo(
        phoneNumber: '+15551234567',
        formattedNumber: '+1-555-123-4567',
        isPrivate: false,
        isInternational: true,
      );

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CallerIdDisplay(callerInfo: callerInfo),
          ),
        ),
      );

      // Assert
      expect(find.text('+1-555-123-4567'), findsOneWidget);
      expect(find.text('International'), findsOneWidget);
      expect(find.byIcon(Icons.phone), findsOneWidget);
    });

    testWidgets('should display Korean badge for Korean number',
        (tester) async {
      // Arrange
      const callerInfo = CallerInfo(
        phoneNumber: '01012345678',
        formattedNumber: '+82-10-1234-5678',
        isPrivate: false,
        isKorean: true,
      );

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CallerIdDisplay(callerInfo: callerInfo),
          ),
        ),
      );

      // Assert
      expect(find.text('Korean Number'), findsOneWidget);
      expect(find.byIcon(Icons.flag), findsOneWidget);
    });

    testWidgets('should not display badges for private number',
        (tester) async {
      // Arrange
      const callerInfo = CallerInfo(
        phoneNumber: '',
        formattedNumber: 'Private Number',
        isPrivate: true,
      );

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CallerIdDisplay(callerInfo: callerInfo),
          ),
        ),
      );

      // Assert
      expect(find.text('Korean Number'), findsNothing);
      expect(find.text('International'), findsNothing);
    });
  });
}
