// ============================================
// 06단계: 제네릭 예제
// ============================================

void main() {
  print('==================================================');
  print('06단계: 제네릭 예제');
  print('==================================================');
  
  // ============================================
  // 1. 제네릭 클래스 - 기본
  // ============================================
  print('\n[1. 제네릭 클래스 - 기본]');
  print('------------------------------');
  
  // String 타입의 Box
  Box<String> stringBox = Box<String>('Hello');
  print('String Box 내용: ${stringBox.getContent()}');
  print('String Box 타입: ${stringBox.getType()}');
  
  // int 타입의 Box
  Box<int> intBox = Box<int>(42);
  print('Int Box 내용: ${intBox.getContent()}');
  print('Int Box 타입: ${intBox.getType()}');
  
  // double 타입의 Box
  Box<double> doubleBox = Box<double>(3.14);
  print('Double Box 내용: ${doubleBox.getContent()}');
  
  // ============================================
  // 2. 제네릭 클래스 - 여러 타입 파라미터
  // ============================================
  print('\n[2. 제네릭 클래스 - 여러 타입 파라미터]');
  print('------------------------------');
  
  Pair<String, int> nameAge = Pair<String, int>('Alice', 25);
  print('Pair: ${nameAge.first} - ${nameAge.second}');
  
  Pair<String, String> fullName = Pair<String, String>('John', 'Doe');
  print('Pair: ${fullName.first} ${fullName.second}');
  
  // ============================================
  // 3. 제네릭 메서드
  // ============================================
  print('\n[3. 제네릭 메서드]');
  print('------------------------------');
  
  // String 리스트
  List<String> fruits = ['apple', 'banana', 'orange'];
  String firstFruit = getFirst(fruits);
  print('첫 번째 과일: $firstFruit');
  
  // int 리스트
  List<int> numbers = [10, 20, 30];
  int firstNumber = getFirst(numbers);
  print('첫 번째 숫자: $firstNumber');
  
  // ============================================
  // 4. 제네릭 메서드 - swap
  // ============================================
  print('\n[4. 제네릭 메서드 - swap]');
  print('------------------------------');
  
  int a = 10;
  int b = 20;
  print('swap 전: a=$a, b=$b');
  swap<int>(a, b);
  // Dart는 값 전달이므로 실제로는 변경되지 않음
  // 참조로 전달하려면 다른 방법 필요
  
  List<int> list = [1, 2];
  print('리스트 swap 전: $list');
  swapInList(list, 0, 1);
  print('리스트 swap 후: $list');
  
  // ============================================
  // 5. 제네릭 제약 (extends)
  // ============================================
  print('\n[5. 제네릭 제약 (extends)]');
  print('------------------------------');
  
  NumberBox<int> intBox2 = NumberBox<int>(100);
  print('Int NumberBox: ${intBox2.value}');
  
  NumberBox<double> doubleBox2 = NumberBox<double>(99.9);
  print('Double NumberBox: ${doubleBox2.value}');
  
  // NumberBox<String> stringBox2 = NumberBox<String>('test');  // 에러!
  
  // ============================================
  // 6. 제네릭과 컬렉션
  // ============================================
  print('\n[6. 제네릭과 컬렉션]');
  print('------------------------------');
  
  // List는 이미 제네릭
  List<String> stringList = ['a', 'b', 'c'];
  List<int> intList = [1, 2, 3];
  
  print('String List: $stringList');
  print('Int List: $intList');
  
  // Map도 제네릭
  Map<String, int> scoreMap = {
    'Alice': 95,
    'Bob': 87,
  };
  print('Score Map: $scoreMap');
  
  // ============================================
  // 7. 제네릭 스택 구현
  // ============================================
  print('\n[7. 제네릭 스택 구현]');
  print('------------------------------');
  
  Stack<String> stringStack = Stack<String>();
  stringStack.push('첫 번째');
  stringStack.push('두 번째');
  stringStack.push('세 번째');
  
  print('스택 크기: ${stringStack.size()}');
  print('스택 맨 위: ${stringStack.peek()}');
  
  while (!stringStack.isEmpty()) {
    print('Pop: ${stringStack.pop()}');
  }
  
  // ============================================
  // 8. 제네릭 캐시 구현
  // ============================================
  print('\n[8. 제네릭 캐시 구현]');
  print('------------------------------');
  
  Cache<String, String> cache = Cache<String, String>();
  cache.set('name', 'Alice');
  cache.set('email', 'alice@example.com');
  
  print('캐시에서 가져오기:');
  print('  name: ${cache.get('name')}');
  print('  email: ${cache.get('email')}');
  print('  phone: ${cache.get('phone')}');
  
  // ============================================
  // 9. 제네릭 유틸리티 함수
  // ============================================
  print('\n[9. 제네릭 유틸리티 함수]');
  print('------------------------------');
  
  List<int> numbers2 = [1, 2, 3, 4, 5];
  print('원본: $numbers2');
  print('역순: ${reverseList(numbers2)}');
  
  List<String> words = ['hello', 'world', 'dart'];
  print('원본: $words');
  print('역순: ${reverseList(words)}');
  
  // ============================================
  // 10. 실전 예제
  // ============================================
  print('\n[10. 실전 예제]');
  print('------------------------------');
  
  // 예제 1: API 응답 래퍼
  ApiResponse<String> successResponse = ApiResponse<String>.success('데이터 로드 완료');
  print('성공 응답: ${successResponse.data}');
  
  ApiResponse<String> errorResponse = ApiResponse<String>.error('에러 발생');
  print('에러 응답: ${errorResponse.error}');
  
  // 예제 2: 옵셔널 값
  Optional<int> someValue = Optional<int>.some(42);
  print('Some 값: ${someValue.value}');
  
  Optional<int> noneValue = Optional<int>.none();
  print('None 값: ${noneValue.value}');
}

// ============================================
// 제네릭 클래스 정의들
// ============================================

// 1. 기본 제네릭 클래스
class Box<T> {
  T content;
  
  Box(this.content);
  
  T getContent() {
    return content;
  }
  
  String getType() {
    return T.toString();
  }
}

// 2. 여러 타입 파라미터
class Pair<F, S> {
  F first;
  S second;
  
  Pair(this.first, this.second);
  
  @override
  String toString() {
    return '($first, $second)';
  }
}

// 3. 제네릭 제약 (extends)
class NumberBox<T extends num> {
  T value;
  
  NumberBox(this.value);
  
  double getDoubleValue() {
    return value.toDouble();
  }
}

// 4. 제네릭 스택
class Stack<T> {
  List<T> _items = [];
  
  void push(T item) {
    _items.add(item);
  }
  
  T? pop() {
    if (_items.isEmpty) return null;
    return _items.removeLast();
  }
  
  T? peek() {
    if (_items.isEmpty) return null;
    return _items.last;
  }
  
  bool isEmpty() {
    return _items.isEmpty;
  }
  
  int size() {
    return _items.length;
  }
}

// 5. 제네릭 캐시
class Cache<K, V> {
  Map<K, V> _cache = {};
  
  void set(K key, V value) {
    _cache[key] = value;
  }
  
  V? get(K key) {
    return _cache[key];
  }
  
  bool contains(K key) {
    return _cache.containsKey(key);
  }
  
  void clear() {
    _cache.clear();
  }
}

// 6. API 응답 래퍼
class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? error;
  
  ApiResponse.success(this.data)
      : success = true,
        error = null;
  
  ApiResponse.error(this.error)
      : success = false,
        data = null;
}

// 7. 옵셔널 값
class Optional<T> {
  final T? _value;
  
  Optional.some(this._value);
  Optional.none() : _value = null;
  
  T? get value => _value;
  
  bool get isSome => _value != null;
  bool get isNone => _value == null;
}

// ============================================
// 제네릭 함수 정의들
// ============================================

// 1. 기본 제네릭 함수
T getFirst<T>(List<T> items) {
  if (items.isEmpty) {
    throw Exception('List is empty');
  }
  return items[0];
}

// 2. swap 함수 (참고용 - Dart는 값 전달)
void swap<T>(T a, T b) {
  T temp = a;
  a = b;
  b = temp;
  print('swap 후 (함수 내부): a=$a, b=$b');
}

// 3. 리스트에서 swap
void swapInList<T>(List<T> list, int index1, int index2) {
  if (index1 >= 0 && index1 < list.length && 
      index2 >= 0 && index2 < list.length) {
    T temp = list[index1];
    list[index1] = list[index2];
    list[index2] = temp;
  }
}

// 4. 리스트 역순
List<T> reverseList<T>(List<T> list) {
  List<T> reversed = [];
  for (int i = list.length - 1; i >= 0; i--) {
    reversed.add(list[i]);
  }
  return reversed;
}

