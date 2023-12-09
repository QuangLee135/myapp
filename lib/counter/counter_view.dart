import 'package:flutter/material.dart';
import '../widget/counter_button.dart';
import '../widget/counter_label.dart';

class CounteView extends StatelessWidget {
  const CounteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CounteLabel(),
            const CounterButton(),
            Text(
              'Lê Đức Quang-2121050840, Chạm vào - để giảm, chạm vào + để tăng',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}