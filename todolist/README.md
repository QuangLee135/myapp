Đây là một ứng dụng Flutter đơn giản giúp bạn quản lý danh sách công việc hàng ngày của mình. Ứng dụng cung cấp giao diện người dùng thân thiện và linh hoạt để thêm, xóa và xem các công việc đã lên kế hoạch.

# Cách cài đặt và sử dụng đoạn code todolist trên github #
Bước 1: Sao chép dự án
- Sao chép dự án từ GitHub bằng cách sử dụng lệnh sau:
    git clone https://github.com/your-username/todo_list_flutter.git
- Thay your-username bằng tên người dùng GitHub của bạn.

Bước 2: Mở Dự Án
-Mở dự án bằng IDE của bạn và mở terminal, hoặc mở bằng VS code tại thư mục dự án.

Bước 3: Cài Đặt Dependencies
-Chạy lệnh sau để cài đặt các dependencies cần thiết( có thể bỏ qua vì đoạn code khá đon giản):
    flutter pub get

Bước 4: Chạy Ứng Dụng
- Chạy ứng dụng trên môi trường mô phỏng:
    flutter run
    Hoặc chạy trục tiếp trên VS code
- Ứng dụng sẽ xuất hiện trên môi trường mô phỏng của bạn.

## Cách đoạn code hoạt động ##
1. Hàm main:
    void main(List<String> args) {
        runApp(MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
            primaryColor: Colors.amberAccent,
            ),
            home: MyApp(),
        ));
    }

- runApp: Hàm này khởi chạy ứng dụng Flutter. Trong trường hợp này, nó được cấu  hình để chạy một MaterialApp, đối tượng chính cho ứng dụng Flutter.

- MaterialApp Configuration:

    debugShowCheckedModeBanner: false: Tắt hiển thị dòng "Debug" ở góc màn hình khi chế độ debug.
    theme: ThemeData(primaryColor: Colors.amberAccent): Đặt chủ đề cho ứng dụng với màu chủ đạo là amberAccent.

- home: MyApp(): Đặt widget chính của ứng dụng là MyApp.

2. Class MyApp (StatefulWidget):

    class MyApp extends StatefulWidget {
        MyApp({Key? key}) : super(key: key);

        @override
        State<MyApp> createState() => _MyAppState();
    }

- MyApp Class:
    Là một StatefulWidget đại diện cho toàn bộ ứng dụng.
    Có một constructor để chấp nhận key và một phương thức để tạo một State mới (_MyAppState).

3. Class _MyAppState (State):

    class _MyAppState extends State<MyApp> {
        final List<DataItems> items = [];

        void _handleAddTask(String name) {
            final newItem = DataItems(id: DateTime.now().toString(), name: name);
            setState(() {
                items.add(newItem);
            });
        }

        void _handleDeleteTask(String id) {
            setState(() {
                items.removeWhere((item) => item.id == id);
            });
        }
        // ...
    }

- Class _MyAppState :
    Là một lớp State của MyApp, chứa trạng thái cụ thể của widget.
    Có một danh sách (List) items để lưu trữ các công việc.

- _handleAddTask :
    Phương thức này được gọi khi người dùng thêm một công việc mới.
    Tạo một đối tượng DataItems mới với id là thời điểm hiện tại và name là tên công việc.
    Sử dụng setState để cập nhật trạng thái và thêm mục mới vào danh sách.

- _handleDeleteTask Method:
    Phương thức này được gọi khi người dùng muốn xóa một công việc.
    Sử dụng setState để cập nhật trạng thái và loại bỏ mục khỏi danh sách dựa trên id.

4. Phương thức build:
    @override
    Widget build(BuildContext context) {
        print('rebuild');
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
                    children: items
                        .map((item) => CardBody(
                            item: item,
                            handleDelete: _handleDeleteTask,
                            ))
                        .toList(),
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    showModalBottomSheet(
                        // ...
                );
            },
                child: const Icon(
                    Icons.add,
                    size: 40,
                ),
            ),
        );
    }

- build Method:
    Phương thức này xây dựng giao diện người dùng của ứng dụng.
    Scaffold là một cấu trúc gốc, bao gồm thanh AppBar, danh sách công việc và nút thêm công việc.

- Danh sách công việc:
    Sử dụng SingleChildScrollView để có thể cuộn khi danh sách lớn.
    Dùng Column và map qua danh sách items để tạo các CardBody tương ứng với mỗi công việc.

- Nút Thêm Công Việc:
    Sử dụng FloatingActionButton để tạo nút thêm công việc.
    Khi nhấp vào nút, sẽ hiển thị bottom sheet sử dụng showModalBottomSheet.

### CardBody (card_body) ###
Đoạn mã nayd  định nghĩa một widget CardBody trong Flutter, chịu trách nhiệm hiển thị thông tin về một mục (item) và cung cấp khả năng xóa thông qua một biểu tượng (icon)

class CardBody extends StatelessWidget {
  CardBody({Key? key, required this.item, required this.handleDelete})
      : super(key: key);

  var item;  // Biến để lưu trữ thông tin của công việc
  final Function handleDelete;  // Hàm callback để xử lý sự kiện xóa công việc

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: _buildContainerDecoration(),
      child: _buildCardContent(),
    );
  }

  // Phần này giải thích hàm _buildContainerDecoration
  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: Color.fromARGB(255, 221, 178, 7),
      borderRadius: BorderRadius.circular(12),
    );
  }

  // Phần này giải thích hàm _buildCardContent
  Widget _buildCardContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTaskText(),
          _buildDeleteButton(),
        ],
      ),
    );
  }

  // Phần này giải thích hàm _buildTaskText
  Widget _buildTaskText() {
    return Text(
      item.name,
      style: TextStyle(
        fontSize: 25,
        color: Color.fromARGB(255, 255, 255, 255),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Phần này giải thích hàm _buildDeleteButton
  Widget _buildDeleteButton() {
    return InkWell(
      onTap: () async {
        if (await _confirmDelete(context)) {
          handleDelete(item.id);
        }
        return;
      },
      child: Icon(
        Icons.delete_outlined,
        color: Color.fromARGB(245, 222, 6, 6),
        size: 30,
      ),
    );
  }

  // Phần này giải thích hàm _confirmDelete
  Future<bool> _confirmDelete(BuildContext context) async {
    // ... (hiện thực hộp thoại xác nhận xóa công việc và trả về kết quả)
  }
}

- Hàm _buildContainerDecoration: Tạo và trả về đối tượng BoxDecoration để định dạng ngoại hình của Container.

- Hàm _buildCardContent: Chứa nội dung của Container, bao gồm một hàng (Row) có nhiều widget con.

- Hàm _buildTaskText: Trả về widget Text để hiển thị tên công việc.

- Hàm _buildDeleteButton: Trả về widget InkWell chứa nút xóa công việc.

- Hàm _confirmDelete: Là một hàm giả định để hiển thị hộp thoại xác nhận xóa công việc và trả về kết quả .   

#### ModelBottom(card_model_bottom) ####
Đây là một widget ModelBottom trong Flutter, được thiết kế để hiển thị một bottom sheet chứa một TextField để người dùng nhập công việc mới và một nút "Add Task" để thêm công việc đó

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ModelBottom extends StatelessWidget {
  ModelBottom({Key? key, required this.addTask}) : super(key: key);
  final Function addTask;

  TextEditingController controller = TextEditingController();

  // Xử lý khi người dùng nhấn nút "Add Task"
  void _handleOnclick(BuildContext context) {
    final name = controller.text;
    if (name.isEmpty) {
      return;
    }
    addTask(name);

    // Đóng bottom sheet sau khi thêm công việc
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            // Widget TextField để người dùng nhập công việc mới
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Task',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Nút "Add Task" để thực hiện thêm công việc
            ElevatedButton(
              onPressed: () => _handleOnclick(context),
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}

- ModelBottom Class: Là một widget Stateless, chịu trách nhiệm hiển thị bottom sheet.

- ModelBottom({Key? key, required this.addTask}): Constructor của ModelBottom.
    Key? key: Tham số key, thường được sử dụng để xác định một widget trong cây widget.
    required this.addTask: Tham số bắt buộc, là một hàm callback (Function) để thêm công việc mới.

- TextEditingController controller = TextEditingController();: Đối tượng TextEditingController để theo dõi và điều khiển nội dung của TextField.

- _handleOnclick: Phương thức xử lý sự kiện khi người dùng nhấn nút "Add Task".

    Lấy nội dung từ TextField và kiểm tra nếu nó không trống rỗng.
    Gọi hàm callback addTask để thêm công việc mới.
    Đóng bottom sheet sau khi thêm công việc bằng cách gọi Navigator.pop(context).

- build Method: Xây dựng cấu trúc giao diện của bottom sheet.

    Padding Widget: Thêm khoảng trắng xung quanh nội dung con để tránh che phủ bởi bàn phím.
    SingleChildScrollView Widget: Cho phép cuộn nếu nội dung vượt quá kích thước màn hình.
    Column Widget: Dùng để xếp các widget con theo chiều dọc.
        TextField Widget: Widget để nhập công việc mới.
        SizedBox Widget: Tạo một khoảng trắng dọc.
        ElevatedButton Widget: Nút "Add Task" để thêm công việc.

##### Items.dart ####
Đoạn mã này định nghĩa một lớp (DataItems) trong Flutter để đại diện cho một mục dữ liệu

class DataItems {
  final String id;
  final String name;

  // Constructor để khởi tạo một đối tượng DataItems
  DataItems({required this.id, required this.name});
}

- class DataItems: Định nghĩa một lớp (class) có tên là DataItems.

- final String id: Trường dữ liệu kiểu chuỗi (String) đại diện cho ID của mục.

- final String name: Trường dữ liệu kiểu chuỗi (String) đại diện cho tên của mục.

- DataItems({required this.id, required this.name}): Constructor của lớp DataItems.
    required this.id: Tham số bắt buộc (required) trong constructor, đại diện cho ID của mục. Giá trị này được gán cho trường dữ liệu id.
    required this.name: Tham số bắt buộc (required) trong constructor, đại diện cho tên của mục. Giá trị này được gán cho trường dữ liệu name.
