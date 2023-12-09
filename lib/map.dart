void main() {
  // Khởi tạo Map
  Map<String, int> myMap = {'one': 1, 'two': 2, 'three': 3};

  // Thêm phần tử vào Map
  myMap['four'] = 4;

  // Sửa giá trị phần tử
  myMap['one'] = 10;

  // Xóa phần tử khỏi Map
  myMap.remove('two');

  // Truy cập phần tử
  int? value = myMap['three'];

  // Duyệt Map
  myMap.forEach((key, value) {
    print('$key: $value');
  });

  // Phương thức tìm kiếm
  bool containsKey = myMap.containsKey('four');
  bool containsValue = myMap.containsValue(3);

  // Phương thức so sánh
  bool isEqual = myMap.containsKey('one') && myMap['one'] == 10;
}
