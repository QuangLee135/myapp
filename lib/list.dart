void main() {
  // Khởi tạo List
  List<int> myList = [1, 2, 3, 4, 5];

  // Thêm phần tử vào List
  myList.add(6);

  // Sửa giá trị phần tử
  myList[0] = 10;

  // Xóa phần tử khỏi List
  myList.remove(2);

  // Truy cập phần tử
  int element = myList[1];

  // Sắp xếp List
  myList.sort();

  // Lọc List
  List<int> filteredList = myList.where((element) => element > 3).toList();

  // Phương thức tìm kiếm
  bool containsElement = myList.contains(5);

  // Phương thức so sánh
  myList.sort((a, b) => a.compareTo(b));
}
