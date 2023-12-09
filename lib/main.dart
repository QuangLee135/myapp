import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thông tin sinh viên',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _maSinhVien = '';
  String _hoTen = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin sinh viên'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Mã sinh viên
            TextField(
              decoration: InputDecoration(
                labelText: 'Mã sinh viên',
              ),
              onChanged: (value) {
                _maSinhVien = value;
              },
            ),
            // Họ và tên
            TextField(
              decoration: InputDecoration(
                labelText: 'Họ và tên',
              ),
              onChanged: (value) {
                _hoTen = value;
              },
            ),
            // nút Xem thông tin
            TextButton(
              onPressed: () {
                // hiển thị thông tin sinh viên
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Mã sinh viên: $_maSinhVien\n'
                      'Họ và tên: $_hoTen',
                    ),
                  ),
                );
              },
              child: Text('Xem thông tin'),
            ),
          ],
        ),
      ),
    );
  }
}
