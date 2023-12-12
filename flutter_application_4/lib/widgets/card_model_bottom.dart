import 'package:flutter/material.dart';

class ModelBottom extends StatelessWidget {
  const ModelBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Your Task'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
