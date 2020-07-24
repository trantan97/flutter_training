main() {
  //khai bao bien, không gán giá trị mặc định đền là null
  //1. Kieu du lieu + ten bien;
  int intA, intB;
  assert(intA == null && intB == null);
  String strA;
  assert(strA == null);

  //2. Khai báo mà không chỉ định kiểu
  var a = 1; //a được suy ra là int
  print("Type of a : ${a.runtimeType}");
  // do a đã được suy ra là int nên không thể gán các dữ liệu kiểu khác cho a
//  a = 1.1;
//  a = "abc";
  //Nếu muốn gán nhiều kiểu giá trị cho biến, khai báo nó với từ khóa dynamic
  dynamic d = 1;
  print("Type of d : ${d.runtimeType}");
  d = 1.1;
  print("Type of d : ${d.runtimeType}");
  d = "abc";
  print("Type of d : ${d.runtimeType}");
  d = true;
  print("Type of d : ${d.runtimeType}");

  // từ khóa final, const
  /*Khi không muốn thay đổi giá trị của một biến dùng từ khóa final, const
  - Const là compile-time constant. Nghĩa là ta phải biết được giá trị của nó trong compile-time
  - Các biến được khai báo như là thuộc tính của một class chỉ có thể là final, không được là const.
  Các thuộc tính là final phải được khỏi tạo trước khi phần thân của constructor chạy
  */
  const constA = 1;
//  constA = 2; //lỗi
//  const constB = DateTime.now();// lỗi không biết giá trị cụ thể trong compile-time
  final finalA = DateTime.now();

  /*
  assert(condition, optionalMessage) - để phá vỡ sự thực thi bình thường nếu một điều kiện boolean là sai.
  * Nếu condition đúng không có gì xảy ra,nếu sai thì sẽ ném ra ngoại lệ AssertionError
  * */

/*Null-aware
*Vì mọi thứ trong Dart có thể là null nên Dart có một toán tử Null-aware để đản bảo null safe
* */
  int x;
  int y = x ?? 0; //gán y bằng x nếu x khác null, nếu x bằng null thì gán y = 0
  x ??= 0; //Syntax sugar của `x = x ?? 0`
  String str;
  print(str?.length); // nếu str khác null lấy length, nếu không trả về null
}
