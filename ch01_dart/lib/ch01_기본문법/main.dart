// ============================================
// 01단계: 기본 문법 예제
// ============================================

void main() {
  print('==================================================');
  print('01단계: 기본 문법 예제');
  print('==================================================');
  
  // ============================================
  // 1. 변수 선언
  // ============================================
  print('\n[1. 변수 선언]');
  print('------------------------------');
  
  // var: 타입 추론
  var name = 'Flutter';
  var age = 25;
  print('var name = $name (타입 추론)');
  print('var age = $age (타입 추론)');
  
  // 명시적 타입 선언
  String userName = 'Dart';
  int userAge = 30;
  double price = 9.99;
  bool isActive = true;
  
  print('String userName = $userName');
  print('int userAge = $userAge');
  print('double price = $price');
  print('bool isActive = $isActive');
  
  // final: 한 번만 할당 가능 (런타임 상수)
  final String finalName = 'Final Value';
  // finalName = 'Changed'; // 에러! final은 재할당 불가
  
  // const: 컴파일 타임 상수
  const int maxCount = 100;
  const String appName = 'MyApp';
  
  print('final finalName = $finalName');
  print('const maxCount = $maxCount');
  print('const appName = $appName');
  
  // ============================================
  // 2. 기본 데이터 타입
  // ============================================
  print('\n[2. 기본 데이터 타입]');
  print('------------------------------');
  
  // 숫자 타입
  int count = 42;
  double height = 175.5;
  num number = 10; // int 또는 double 둘 다 가능
  
  print('int count = $count');
  print('double height = $height');
  print('num number = $number');
  
  // 숫자 연산
  int a = 10;
  int b = 3;
  print('\n숫자 연산:');
  print('$a + $b = ${a + b}');
  print('$a - $b = ${a - b}');
  print('$a * $b = ${a * b}');
  print('$a / $b = ${a / b}');
  print('$a ~/ $b = ${a ~/ b}'); // 정수 나눗셈
  print('$a % $b = ${a % b}'); // 나머지
  
  // 문자열
  String message = 'Hello';
  String greeting = "World";
  String multiLine = '''
여러 줄
문자열을
작성할 수 있습니다
''';
  
  print('\n문자열:');
  print('message = $message');
  print('greeting = $greeting');
  print('multiLine = $multiLine');
  
  // 문자열 보간 (String Interpolation)
  String firstName = 'Flutter';
  String lastName = 'Dart';
  int score = 95;
  
  String fullName = '$firstName $lastName';
  String scoreMessage = 'Score: $score';
  String expression = 'Total: ${score + 5}'; // 표현식 사용
  
  print('\n문자열 보간:');
  print('fullName = $fullName');
  print('scoreMessage = $scoreMessage');
  print('expression = $expression');
  
  // 문자열 메서드
  String text = '  Hello World  ';
  print('\n문자열 메서드:');
  print('원본: "$text"');
  print('대문자: ${text.toUpperCase()}');
  print('소문자: ${text.toLowerCase()}');
  print('공백 제거: "${text.trim()}"');
  print('길이: ${text.length}');
  print('포함 여부: ${text.contains("Hello")}');
  
  // 불리언
  bool isStudent = true;
  bool isGraduated = false;
  
  print('\n불리언:');
  print('isStudent = $isStudent');
  print('isGraduated = $isGraduated');
  print('논리 연산: ${isStudent && !isGraduated}');
  
  // ============================================
  // 3. 함수
  // ============================================
  print('\n[3. 함수]');
  print('------------------------------');
  
  // 기본 함수 호출
  printMessage();
  greet('Alice');
  
  // 반환값이 있는 함수
  int sum = add(10, 20);
  print('add(10, 20) = $sum');
  
  // 화살표 함수
  int product = multiply(5, 6);
  print('multiply(5, 6) = $product');
  
  // 선택적 매개변수
  showInfo('Bob');
  showInfo('Charlie', 25);
  
  // 명명된 매개변수
  createUser(name: 'David', age: 30);
  createUser(name: 'Eve'); // age는 기본값 0 사용
  
  // 기본값이 있는 명명된 매개변수
  greetUser('Frank');
  greetUser('Grace', greeting: 'Hi');
  
  // 여러 매개변수 조합
  calculateTotal(100, discount: 10);
  calculateTotal(200, discount: 20, tax: 5);
}

// ============================================
// 함수 정의들
// ============================================

// 기본 함수 (반환값 없음)
void printMessage() {
  print('Hello from function!');
}

// 매개변수가 있는 함수
void greet(String name) {
  print('Hello, $name!');
}

// 반환값이 있는 함수
int add(int a, int b) {
  return a + b;
}

// 화살표 함수 (단일 표현식)
int multiply(int a, int b) => a * b;

// 선택적 매개변수 (대괄호 사용)
void showInfo(String name, [int? age]) {
  print('Name: $name');
  if (age != null) {
    print('Age: $age');
  } else {
    print('Age: not provided');
  }
}

// 명명된 매개변수 (중괄호 사용)
void createUser({required String name, int age = 0}) {
  print('User created - Name: $name, Age: $age');
}

// 기본값이 있는 명명된 매개변수
void greetUser(String name, {String greeting = 'Hello'}) {
  print('$greeting, $name!');
}

// 여러 매개변수 조합
void calculateTotal(double price, {double discount = 0, double tax = 0}) {
  double discountedPrice = price - discount;
  double finalPrice = discountedPrice + (discountedPrice * tax / 100);
  print('원가: \$$price');
  print('할인: \$$discount');
  print('세금: $tax%');
  print('최종 가격: \$${finalPrice.toStringAsFixed(2)}');
}

