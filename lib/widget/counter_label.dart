import 'package:flutter/material.dart';
import '../counter_controller.dart';
import '../counter_model.dart';

class CounteLabel extends StatelessWidget {
  const CounteLabel({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CounterController(),
      builder: (context, child) {
        return Text(
          CounterModel().counter.toString(),
          style: const TextStyle(
            color: Colors.orange,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}