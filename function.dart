// mọi function đèu trả về một giá trị, mặc định là null
//khai báo 1 function.
bool isEvenNumber(num a) {
  return a % 2 == 0;
}

//kiểu trả về có thể được bỏ qua, truy nhiên Dart không recommend
isOddNumber(num a) {
  return a % 2 == 1;
}

//Nếu function chỉ chưa một biểu thức,có thể viết gọn như sau
bool isNumber(dynamic a) => a is num;

/*Function có 2 loại tham số : required và optional.
Required parameters sẽ được viết trước, theo sau là các optional parameters.
Optional parameters có thể là named hoặc positional, nhưng không được là cả hai
*/

//Named parameters được đặt trong dấu {}
num add(num numberOne, {num numberTwo = 0, num numberThree = 0}) =>
    numberOne + numberTwo + numberThree;
//Positional được đặt trong dấu []
num minus(num numberOne, [num numberTwo = 0, num numberThree = 0]) =>
    numberOne - numberTwo - numberThree;
// func cũng co thể nhận một func khác làm tham số truyền vào
void calculate(num a, num b, {Function(num) callback} ){
  num result = add(a, numberTwo: b);
  if(isEvenNumber(result) && callback != null) callback(result);
}

main() {
  print(isEvenNumber(2));
  print(isOddNumber(1));
  print(isNumber(""));
  //named parameters, không cần theo thứ tự
  print(add(1, numberThree: 2)); // numberOne = 1, numberTwo = 0, numberThree = 2
  //cần theo thứ tự, không bỏ cách được
  print(minus(1, 2)); // numberOne = 1, numberTwo = 2, numberThree = 3
  
  calculate(1, 2,callback: (num) => print("Result: $num"));
}
