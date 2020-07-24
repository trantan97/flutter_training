//Lập trình bất đồng bộ trong dart
/*Future là kết quả trả về của hoạt động bất đồng bộ.
 Future có hai trạng thái là : hoàn thành và chưa hoàn thành
 */
//Để định nghĩa một hàn bất đồng bộ ta thêm từ khóa async trước thân hàm.
Future<String> getData() async {
  String result = "";
  for (int i = 1; i < 1000000; i++) {
    result += "$i";
  }
  return result;
}

//Từ khóa await chỉ làm việc trong hàm async, nó đợi một hàm bất đồng bộ khác hoàn thành
Future<void> printData() async {
  print(await getData());
}

/*Để lấy dữ liệu từ 1 future trong một hàm đồng bộ ta sử dụng nhứng callback đã được dart cung cấp như
then, whenComplete,
*/
main() {
  getData().then(
    (string) => print(string),
    onError: (e) => print('Error: ${e.toString()}'),
  );
}
