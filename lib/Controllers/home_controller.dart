import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var formkey = GlobalKey<FormState>();
  PageController? pageController;

  final input = ''.obs;
  double output = 0.0;
  List<Map<String, String>> history = [];

  @override
  void onInit() {
    pageController = PageController(initialPage: 2);
    super.onInit();
  }

  @override
  void dispose() {
    pageController!.dispose();
    super.dispose();
  }

//-----------------
  void submit() {
    if (input.isEmpty) {
      return;
    }
    Parser p = Parser();
    Expression exp = p.parse(input.value);
    ContextModel cm = ContextModel();

    try {
      // Perform your calculations here
      output = exp.evaluate(EvaluationType.REAL, cm);
    } catch (e) {
      // Handle any exceptions that may occur during parsing or evaluation
      print("Error: $e");
      // You can choose to set output to a default value or handle errors differently
      output = 0.0; // Set to a default value in case of an error
    }

    // Update history or perform other actions as needed
    history.add({
      'input': input.value,
      'output': output.toString(),
    });

    update();
  }

  //-----------------
  // void addDot() {
  //   input.value += '. ';
  //   update();
  // }
}
