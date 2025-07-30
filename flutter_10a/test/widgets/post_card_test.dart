import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_10a/widgets/post_card.dart';

void main() {
  group('PostCard Widget Tests', () {
    testWidgets('PostCard displays title and body correctly', (WidgetTester tester) async {
      // Arrange
      const testTitle = 'Test Title for PostCard';
      const testBody = 'This is a test body content for the PostCard widget. It should display properly within the card layout.';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PostCard(
              title: testTitle,
              body: testBody,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(testBody), findsOneWidget);
    });

    testWidgets('PostCard has correct text styling', (WidgetTester tester) async {
      // Arrange
      const testTitle = 'Styled Title';
      const testBody = 'Styled body content';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PostCard(
              title: testTitle,
              body: testBody,
            ),
          ),
        ),
      );

      // Assert
      final titleWidget = tester.widget<Text>(find.text(testTitle));
      expect(titleWidget.style?.fontSize, 18.0);
      expect(titleWidget.style?.fontWeight, FontWeight.bold);
      expect(titleWidget.style?.color, Colors.black87);

      final bodyWidget = tester.widget<Text>(find.text(testBody));
      expect(bodyWidget.style?.fontSize, 16.0);
      expect(bodyWidget.style?.color, Colors.black54);
      expect(bodyWidget.style?.height, 1.4);
    });

    testWidgets('PostCard handles tap events correctly', (WidgetTester tester) async {
      // Arrange
      bool wasTapped = false;
      void onTapCallback() {
        wasTapped = true;
      }

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostCard(
              title: 'Tappable Title',
              body: 'Tappable body',
              onTap: onTapCallback,
            ),
          ),
        ),
      );

      // Find and tap the PostCard
      await tester.tap(find.byType(PostCard));
      await tester.pump();

      // Assert
      expect(wasTapped, isTrue);
    });

    testWidgets('PostCard displays with proper Card structure', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PostCard(
              title: 'Card Test',
              body: 'Testing card structure',
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('PostCard handles empty or long text gracefully', (WidgetTester tester) async {
      // Arrange
      const longTitle = 'This is a very long title that should be truncated properly when it exceeds the maximum number of lines allowed for the title text in the PostCard widget';
      const longBody = 'This is a very long body content that should also be truncated properly when it exceeds the maximum number of lines. The body text should maintain readability while handling overflow situations gracefully. This content is intentionally verbose to test the ellipsis behavior of the text widget.';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PostCard(
              title: longTitle,
              body: longBody,
            ),
          ),
        ),
      );

      // Assert
      final titleWidget = tester.widget<Text>(find.text(longTitle));
      expect(titleWidget.maxLines, 2);
      expect(titleWidget.overflow, TextOverflow.ellipsis);

      final bodyWidget = tester.widget<Text>(find.text(longBody));
      expect(bodyWidget.maxLines, 4);
      expect(bodyWidget.overflow, TextOverflow.ellipsis);
    });

    testWidgets('PostCard without onTap callback works correctly', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PostCard(
              title: 'No Tap Title',
              body: 'No tap body',
            ),
          ),
        ),
      );

      // Assert - Should not throw error when tapped without callback
      expect(() => tester.tap(find.byType(PostCard)), returnsNormally);
      await tester.pump();
    });
  });
}
