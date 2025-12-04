// ============================================
// 05단계: 클래스와 객체 예제
// ============================================

void main() {
  print('==================================================');
  print('05단계: 클래스와 객체 예제');
  print('==================================================');
  
  // ============================================
  // 1. 기본 클래스
  // ============================================
  print('\n[1. 기본 클래스]');
  print('------------------------------');
  
  Person person = Person('Alice', 25);
  person.introduce();
  person.haveBirthday();
  person.introduce();
  
  // ============================================
  // 2. 생성자 - 기본 생성자
  // ============================================
  print('\n[2. 기본 생성자]');
  print('------------------------------');
  
  User user1 = User('Bob', 30);
  print('User1: ${user1.name}, ${user1.age}');
  
  // ============================================
  // 3. 생성자 - 명명된 생성자
  // ============================================
  print('\n[3. 명명된 생성자]');
  print('------------------------------');
  
  User guest = User.guest();
  print('Guest: ${guest.name}, ${guest.age}');
  
  User admin = User.admin('Admin User');
  print('Admin: ${admin.name}, ${admin.age}');
  
  // ============================================
  // 4. 생성자 - fromMap
  // ============================================
  print('\n[4. fromMap 생성자]');
  print('------------------------------');
  
  Map<String, dynamic> userData = {
    'name': 'Charlie',
    'age': 28,
  };
  
  User user2 = User.fromMap(userData);
  print('From Map: ${user2.name}, ${user2.age}');
  
  // ============================================
  // 5. 생성자 - 명명된 매개변수
  // ============================================
  print('\n[5. 명명된 매개변수 생성자]');
  print('------------------------------');
  
  User user3 = User.detailed(
    name: 'David',
    age: 35,
    email: 'david@example.com',
  );
  print('Detailed: ${user3.name}, ${user3.age}, ${user3.email}');
  
  User user4 = User.detailed(name: 'Eve');
  print('Detailed (기본값): ${user4.name}, ${user4.age}');
  
  // ============================================
  // 6. Getter와 Setter
  // ============================================
  print('\n[6. Getter와 Setter]');
  print('------------------------------');
  
  Rectangle rect = Rectangle(10, 20);
  print('너비: ${rect.width}, 높이: ${rect.height}');
  print('면적: ${rect.area}');
  
  rect.width = 15;
  print('너비 변경 후 면적: ${rect.area}');
  
  // ============================================
  // 7. 상속
  // ============================================
  print('\n[7. 상속]');
  print('------------------------------');
  
  Animal animal = Animal('Generic Animal');
  animal.makeSound();
  animal.sleep();
  
  Dog dog = Dog('Buddy');
  dog.makeSound();  // 오버라이드된 메서드
  dog.wagTail();    // Dog만의 메서드
  dog.sleep();      // 상속받은 메서드
  
  Cat cat = Cat('Whiskers');
  cat.makeSound();
  cat.climb();
  
  // ============================================
  // 8. 추상 클래스
  // ============================================
  print('\n[8. 추상 클래스]');
  print('------------------------------');
  
  Circle circle = Circle(5.0);
  print('원의 반지름: ${circle.radius}');
  print('원의 면적: ${circle.area()}');
  circle.printArea();
  
  Rectangle2 rect2 = Rectangle2(10.0, 20.0);
  print('사각형의 면적: ${rect2.area()}');
  rect2.printArea();
  
  // ============================================
  // 9. 정적 멤버 (Static)
  // ============================================
  print('\n[9. 정적 멤버]');
  print('------------------------------');
  
  print('MathUtils.PI: ${MathUtils.PI}');
  print('MathUtils.add(10, 20): ${MathUtils.add(10, 20)}');
  print('MathUtils.multiply(5, 6): ${MathUtils.multiply(5, 6)}');
  
  // ============================================
  // 10. 실전 예제
  // ============================================
  print('\n[10. 실전 예제]');
  print('------------------------------');
  
  // 예제 1: 학생 관리
  Student student1 = Student('Alice', 20, 'Computer Science');
  student1.addGrade(95);
  student1.addGrade(88);
  student1.addGrade(92);
  student1.displayInfo();
  
  // 예제 2: 은행 계좌
  BankAccount account = BankAccount('123456', 1000.0);
  account.deposit(500.0);
  account.withdraw(200.0);
  account.displayBalance();
}

// ============================================
// 클래스 정의들
// ============================================

// 1. 기본 클래스
class Person {
  String name;
  int age;
  
  // 생성자
  Person(this.name, this.age);
  
  // 메서드
  void introduce() {
    print('안녕하세요, 저는 $name이고 ${age}살입니다.');
  }
  
  void haveBirthday() {
    age++;
    print('$name의 생일! 나이가 ${age}살이 되었습니다.');
  }
}

// 2. 생성자 예제 클래스
class User {
  String name;
  int age;
  String? email;
  
  // 기본 생성자
  User(this.name, this.age);
  
  // 명명된 생성자 1: 게스트
  User.guest() : name = 'Guest', age = 0;
  
  // 명명된 생성자 2: 관리자
  User.admin(String name) : name = name, age = 0;
  
  // fromMap 생성자
  User.fromMap(Map<String, dynamic> map)
      : name = map['name'] as String,
        age = map['age'] as int;
  
  // 명명된 매개변수 생성자
  User.detailed({required this.name, this.age = 0, this.email});
}

// 3. Getter와 Setter
class Rectangle {
  double _width;
  double _height;
  
  Rectangle(this._width, this._height);
  
  // Getter
  double get width => _width;
  double get height => _height;
  double get area => _width * _height;
  
  // Setter
  set width(double value) {
    if (value > 0) {
      _width = value;
    }
  }
  
  set height(double value) {
    if (value > 0) {
      _height = value;
    }
  }
}

// 4. 상속 - 부모 클래스
class Animal {
  String name;
  
  Animal(this.name);
  
  void makeSound() {
    print('$name이(가) 소리를 냅니다.');
  }
  
  void sleep() {
    print('$name이(가) 잠을 잡니다.');
  }
}

// 4-1. 상속 - 자식 클래스 1
class Dog extends Animal {
  Dog(String name) : super(name);
  
  @override
  void makeSound() {
    print('$name이(가) 멍멍 짖습니다!');
  }
  
  void wagTail() {
    print('$name이(가) 꼬리를 흔듭니다.');
  }
}

// 4-2. 상속 - 자식 클래스 2
class Cat extends Animal {
  Cat(String name) : super(name);
  
  @override
  void makeSound() {
    print('$name이(가) 야옹 웁니다!');
  }
  
  void climb() {
    print('$name이(가) 나무를 올라갑니다.');
  }
}

// 5. 추상 클래스
abstract class Shape {
  // 추상 메서드 (구현 없음)
  double area();
  
  // 일반 메서드 (구현 있음)
  void printArea() {
    print('면적: ${area()}');
  }
}

// 5-1. 추상 클래스 구현 1
class Circle extends Shape {
  double radius;
  
  Circle(this.radius);
  
  @override
  double area() {
    return 3.14159 * radius * radius;
  }
}

// 5-2. 추상 클래스 구현 2
class Rectangle2 extends Shape {
  double width;
  double height;
  
  Rectangle2(this.width, this.height);
  
  @override
  double area() {
    return width * height;
  }
}

// 6. 정적 멤버
class MathUtils {
  // 정적 변수
  static const double PI = 3.14159;
  
  // 정적 메서드
  static int add(int a, int b) {
    return a + b;
  }
  
  static int multiply(int a, int b) {
    return a * b;
  }
}

// 7. 실전 예제 - 학생 클래스
class Student {
  String name;
  int age;
  String major;
  List<int> grades = [];
  
  Student(this.name, this.age, this.major);
  
  void addGrade(int grade) {
    grades.add(grade);
  }
  
  double getAverage() {
    if (grades.isEmpty) return 0.0;
    int sum = grades.reduce((a, b) => a + b);
    return sum / grades.length;
  }
  
  void displayInfo() {
    print('=== 학생 정보 ===');
    print('이름: $name');
    print('나이: $age');
    print('전공: $major');
    print('점수: $grades');
    print('평균: ${getAverage().toStringAsFixed(1)}');
  }
}

// 8. 실전 예제 - 은행 계좌 클래스
class BankAccount {
  String accountNumber;
  double balance;
  
  BankAccount(this.accountNumber, this.balance);
  
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print('입금: \$${amount.toStringAsFixed(2)}');
    }
  }
  
  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      print('출금: \$${amount.toStringAsFixed(2)}');
    } else {
      print('잔액이 부족합니다.');
    }
  }
  
  void displayBalance() {
    print('계좌번호: $accountNumber');
    print('잔액: \$${balance.toStringAsFixed(2)}');
  }
}

