import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/items.dart';
import 'package:flutter_application_4/widgets/card_model_bottom.dart';

import 'widgets/card_body.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.amberAccent,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<DataItems> items = [
    DataItems(id: '1', name: 'Tap the duc'),
    DataItems(id: '2', name: 'Danh rang'),
    DataItems(id: '3', name: 'An sang'),
    DataItems(id: '4', name: 'Di hoc'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'ToDoList',
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: items.map((item) => CardBody(item: item)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                print(context);
                return ModelBottom();
              });
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
