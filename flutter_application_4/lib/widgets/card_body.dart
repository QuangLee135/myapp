import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

// ignore: must_be_immutable
class CardBody extends StatelessWidget {
  CardBody({Key? key, required this.item, required this.handleDelete})
      : super(key: key);
  var item;
  final Function handleDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 125, 124, 120),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  handleDelete(item.id);
                }
                return;
              },
              child: const Icon(
                Icons.delete_outlined,
                color: Color.fromARGB(245, 222, 6, 6),
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
