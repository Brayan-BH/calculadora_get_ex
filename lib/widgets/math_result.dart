import 'package:calculadora_get_ex/controller/calculator_controller.dart';
import 'package:calculadora_get_ex/widgets/line_separator.dart';
import 'package:calculadora_get_ex/widgets/main_result.dart';
import 'package:calculadora_get_ex/widgets/sub_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

class MathREsults extends StatelessWidget {
  const MathREsults({super.key});

  @override
  Widget build(BuildContext context) {
    final calculatorCtrl = Get.find<CalculatorController>();
    return Obx(() => Column(
          children: [
            SubResult(text: '${calculatorCtrl.firstNumber}'),
            SubResult(text: '${calculatorCtrl.operation}'),
            SubResult(text: '${calculatorCtrl.secondNumber}'),
            LineSeparator(),
            MainResultText(text: '${calculatorCtrl.mathresult}'),
          ],
        ));
  }
}
