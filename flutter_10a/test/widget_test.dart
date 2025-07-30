// Comprehensive Flutter widget tests for UI components
// Created by: Pooja
// Project: Flutter UI Component Testing Experiment
//
// This file contains unit tests for the main UI components including:
// - Counter functionality
// - Widget initialization
// - User interaction testing
// - UI state management

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_10a/main.dart';

void main() {
  group('MyApp Widget Tests', () {
    testWidgets('MyApp initializes correctly with proper theme and title', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(MyHomePage), findsOneWidget);
      
      // Verify the app title
      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      expect(app.title, 'Flutter Demo');
      
      // Verify theme configuration
      expect(app.theme?.colorScheme.primary, isNotNull);
    });

    testWidgets('MyApp displays correct home page title', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      expect(find.text('Flutter Demo Home Page'), findsOneWidget);
    });
  });

  group('MyHomePage Counter Tests', () {
    testWidgets('Counter starts at zero and displays correctly', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      expect(find.text('You have pushed the button this many times:'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });

    testWidgets('Counter increments when FloatingActionButton is tapped', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Assert
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Counter increments multiple times correctly', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }

      // Assert
      expect(find.text('5'), findsOneWidget);
      expect(find.text('0'), findsNothing);
    });

    testWidgets('FloatingActionButton has correct tooltip', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      final FloatingActionButton fab = tester.widget(find.byType(FloatingActionButton));
      expect(fab.tooltip, 'Increment');
    });

    testWidgets('FloatingActionButton contains add icon', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      expect(find.byIcon(Icons.add), findsOneWidget);
    });
  });

  group('MyHomePage UI Structure Tests', () {
    testWidgets('MyHomePage contains all required UI elements', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets('AppBar displays correct title and styling', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      expect(find.text('Flutter Demo Home Page'), findsOneWidget);
      
      final AppBar appBar = tester.widget(find.byType(AppBar));
      expect(appBar.backgroundColor, isNotNull);
    });

    testWidgets('Counter text has correct styling', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      final Text counterText = tester.widget(find.text('0'));
      expect(counterText.style, isNotNull);
    });

    testWidgets('Column has correct main axis alignment', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      final Column column = tester.widget(find.byType(Column));
      expect(column.mainAxisAlignment, MainAxisAlignment.center);
    });
  });

  group('MyHomePage State Management Tests', () {
    testWidgets('Counter state persists during widget rebuilds', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MyApp());
      
      // Act
      await tester.tap(find.byIcon(Icons.add));
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      
      // Force rebuild by pumping again
      await tester.pump();

      // Assert
      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('Widget title property is immutable', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MyApp());

      // Assert
      final MyHomePage homePage = tester.widget(find.byType(MyHomePage));
      expect(homePage.title, 'Flutter Demo Home Page');
      expect(homePage.key, isNotNull);
    });
  });
}
