// Bài thực hành: Sử dụng các kiểu dữ liệu List, Set và Map trong Dart

// Họ tên: Lê Đức Quang
// MSSV: 21210508440
void main() {
  // 1. Khởi tạo và sử dụng List

  // Khởi tạo list rỗng và list có giá trị ban đầu
  List<int> List_rong = [];
  List<int> List_ban_dau = [1, 2, 3, 4, 5];

  // Truy cập, thêm, sửa, xóa phần tử trong list
  int gia_tri_dau = List_ban_dau[0];
  List_ban_dau.add(6);
  List_ban_dau[1] = 7;
  int gia_tri_da_xoa = List_ban_dau.removeAt(1);

  // Sắp xếp và lọc list
  List_ban_dau.sort();
  List<int> danh_sach_loc =
      List_ban_dau.where((phanTu) => phanTu % 5 == 0).toList();

  // In list sau khi thao tác
  print("Danh sach ban dau: $List_ban_dau");
  print("Gia tri dau tien: $List_rong");
  print("Danh sach khi them 6 : $List_ban_dau");
  print("Danh sach khi sua 1: $List_ban_dau");
  print("Gia tri bi xoa: $gia_tri_da_xoa");
  print("Danh sach sau khi loc cac so chia het cho 5: $danh_sach_loc");

  // 2. Khởi tạo và sử dụng Set

  // Khởi tạo set rỗng và set có giá trị ban đầu
  Set<int> set_rong = {};
  Set<int> set_ban_dau = {1, 2, 3, 4, 5};

  // Thêm, xóa phần tử trong set
  set_ban_dau.add(6);
  set_ban_dau.remove(1);

  // Các phép toán trên set: union, intersection, difference
  Set<int> tap_hop1 = {1, 2, 3};
  Set<int> tap_hop2 = {3, 4, 5};
  Set<int> tap_hop_hop = tap_hop1.union(tap_hop2);
  Set<int> tap_hop_giao = tap_hop1.intersection(tap_hop2);
  Set<int> tap_hop_hieu = tap_hop1.difference(tap_hop2);

  // In set sau khi thao tác
  print("Tap hop ban dau: $set_ban_dau");
  print("Tap hop ban dau khi them 6: $set_ban_dau");
  print("Tap hop ban dau khi xoa 3: $set_ban_dau");
  print("Tap hop hop của tap_hop1 và tap_hop2: $tap_hop_hop");
  print("Tap hop giao cua tap_hop1 và tap_hop2: $tap_hop_giao");
  print("Tap hop hieu cua tap_hop1 và tap_hop2: $tap_hop_hieu");

  // 3. Khởi tạo và sử dụng Map

  // Khởi tạo map rỗng và map có giá trị ban đầu
  Map<String, dynamic> map_rong = {};
  Map<String, dynamic> map_ban_dau = {
    'ten': 'Quang',
    'tuoi': 20,
    'thanhPho': 'Ha Noi'
  };

  // Thêm, sửa, xóa phần tử trong map
  map_ban_dau['chuc_ngiep'] = 'Phap su';
  map_ban_dau['tuoi'] = 21;
  map_ban_dau.remove('thanhPho');

  // Duyệt các phần tử trong map và in chúng ra
  map_ban_dau.forEach((key, value) {
    print('$key: $value');
  });
}
