import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

// This is the controller class that we want to test
class CounterController extends GetxController {
  // This is the observable value that holds the counter
  final _counter = 0.obs;

  // This is a getter that returns the value of the counter
  int get counter => _counter.value;

  // This is a method that increments the counter by one
  void increment() {
    _counter.value++;
  }
}

void main() {
  // This is the test group that contains all the tests for the controller
  group('CounterController', () {
    // This is the variable that holds the instance of the controller
    late CounterController controller;

    // This is the setup function that runs before each test
    setUp(() {
      // This is where we create and put the controller using GetX
      controller = Get.put(CounterController());
      Get.testMode = true;
    });

    // This is the teardown function that runs after each test
    tearDown(() {
      // This is where we delete the controller using GetX
      Get.delete<CounterController>();
    });

    // This is a test case that checks if the initial value of the counter is zero
    test('initial value should be zero', () {
      // This is where we use the expect function to assert the expected value
      expect(controller.counter, 0);
    });

    // This is a test case that checks if the increment method works as expected
    test('increment should increase counter by one', () {
      // This is where we call the increment method on the controller
      controller.increment();

      // This is where we use the expect function to assert the expected value
      expect(controller.counter, 1);
    });
  });
}
