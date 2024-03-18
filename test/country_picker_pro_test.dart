import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments and decrements', (WidgetTester tester) async {
    int counter = 0;

    void incrementCounter() {
      counter++;
    }

    void decrementCounter() {
      counter--;
    }

    // Verify initial counter value
    expect(counter, 0);

    // Increment counter
    incrementCounter();
    expect(counter, 1);

    // Decrement counter
    decrementCounter();
    expect(counter, 0);
  });
}
