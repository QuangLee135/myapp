void main() {
  // Khởi tạo Set
  Set<int> mySet = {1, 2, 3, 4, 5};

  // Thêm phần tử vào Set
  mySet.add(6);

  // Xóa phần tử khỏi Set
  mySet.remove(2);

  // Phép toán trên Set
  Set<int> intersection = mySet.intersection({4, 5, 6});
  Set<int> union = mySet.union({7, 8, 9});

  // Phương thức kiểm tra
  bool containsElement = mySet.contains(5);

  // Phương thức so sánh
  bool isEqual = mySet.containsAll({1, 3, 5});
}
