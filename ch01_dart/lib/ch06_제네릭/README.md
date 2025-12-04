# -------------------------------------------
# 06단계: 제네릭
# -------------------------------------------

## 📚 학습 목표

이 단계에서는 Dart의 제네릭을 학습합니다:
- 제네릭 클래스 정의와 사용
- 제네릭 메서드
- 타입 제약 (extends)
- 제네릭과 컬렉션
- 실전 활용 예제

---

# -------------------------------------------
# 1. 제네릭이란?
# -------------------------------------------

## 1.1 제네릭의 필요성

**문제 상황:**
```dart
// String을 저장하는 Box
class StringBox {
  String content;
  StringBox(this.content);
}

// int를 저장하는 Box
class IntBox {
  int content;
  IntBox(this.content);
}
```

- 같은 구조인데 타입만 다른 클래스를 여러 개 만들어야 함
- 코드 중복 발생

**해결책: 제네릭**
```dart
class Box<T> {
  T content;
  Box(this.content);
}
```

- 하나의 클래스로 여러 타입 처리
- 타입 안정성 보장
- 코드 재사용성 향상

---

# -------------------------------------------
# 2. 제네릭 클래스
# -------------------------------------------

## 2.1 기본 제네릭 클래스

```dart
class Box<T> {
  T content;
  
  Box(this.content);
  
  T getContent() {
    return content;
  }
}
```

**사용:**
```dart
Box<String> stringBox = Box<String>('Hello');
Box<int> intBox = Box<int>(42);
```

- `<T>`: 타입 파라미터
- `T`: 타입 변수 (임의의 이름 가능)
- 사용 시 구체적인 타입 지정

## 2.2 여러 타입 파라미터

```dart
class Pair<F, S> {
  F first;
  S second;
  
  Pair(this.first, this.second);
}
```

**사용:**
```dart
Pair<String, int> nameAge = Pair<String, int>('Alice', 25);
Pair<String, String> fullName = Pair<String, String>('John', 'Doe');
```

- 여러 타입 파라미터 사용 가능
- 각각 독립적인 타입 지정

---

# -------------------------------------------
# 3. 제네릭 메서드
# -------------------------------------------

## 3.1 기본 제네릭 메서드

```dart
T getFirst<T>(List<T> items) {
  if (items.isEmpty) {
    throw Exception('List is empty');
  }
  return items[0];
}
```

**사용:**
```dart
List<String> fruits = ['apple', 'banana'];
String first = getFirst<String>(fruits);

List<int> numbers = [1, 2, 3];
int firstNum = getFirst<int>(numbers);
```

- 메서드 레벨에서 제네릭 사용
- 타입 추론 가능 (생략 가능)

## 3.2 타입 추론

```dart
// 타입 명시
String first = getFirst<String>(fruits);

// 타입 추론 (생략 가능)
String first = getFirst(fruits);
```

- Dart가 타입을 자동으로 추론
- 코드가 더 간결해짐

---

# -------------------------------------------
# 4. 제네릭 제약 (extends)
# -------------------------------------------

## 4.1 타입 제약

```dart
class NumberBox<T extends num> {
  T value;
  
  NumberBox(this.value);
  
  double getDoubleValue() {
    return value.toDouble();
  }
}
```

**사용:**
```dart
NumberBox<int> intBox = NumberBox<int>(100);      // 가능
NumberBox<double> doubleBox = NumberBox<double>(99.9);  // 가능
// NumberBox<String> stringBox = NumberBox<String>('test');  // 에러!
```

**의미:**
- `T extends num`: T는 num 또는 num의 하위 타입만 가능
- 타입 안정성 보장
- 특정 메서드 사용 가능

## 4.2 제약의 활용

```dart
class ComparableBox<T extends Comparable<T>> {
  T value;
  
  ComparableBox(this.value);
  
  bool isGreaterThan(T other) {
    return value.compareTo(other) > 0;
  }
}
```

- 특정 인터페이스를 구현한 타입만 허용
- 해당 인터페이스의 메서드 사용 가능

---

# -------------------------------------------
# 5. 제네릭과 컬렉션
# -------------------------------------------

## 5.1 List와 제네릭

```dart
List<String> stringList = ['a', 'b', 'c'];
List<int> intList = [1, 2, 3];
```

- List는 제네릭 클래스
- 타입을 명시하면 타입 안정성 보장

## 5.2 Map과 제네릭

```dart
Map<String, int> scoreMap = {
  'Alice': 95,
  'Bob': 87,
};
```

- Map은 두 개의 타입 파라미터 (키, 값)
- 타입 안정성 보장

## 5.3 제네릭 없이 사용 (비권장)

```dart
List dynamicList = [1, 'hello', 3.14];  // 타입 안정성 없음
```

- 타입을 명시하지 않으면 `dynamic`
- 런타임 에러 위험 증가

---

# -------------------------------------------
# 6. 제네릭 스택 구현
# -------------------------------------------

## 6.1 스택 클래스

```dart
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
}
```

**사용:**
```dart
Stack<String> stack = Stack<String>();
stack.push('첫 번째');
stack.push('두 번째');
String? item = stack.pop();
```

- LIFO (Last In First Out) 구조
- 어떤 타입이든 저장 가능

---

# -------------------------------------------
# 7. 제네릭 캐시 구현
# -------------------------------------------

## 7.1 캐시 클래스

```dart
class Cache<K, V> {
  Map<K, V> _cache = {};
  
  void set(K key, V value) {
    _cache[key] = value;
  }
  
  V? get(K key) {
    return _cache[key];
  }
}
```

**사용:**
```dart
Cache<String, String> cache = Cache<String, String>();
cache.set('name', 'Alice');
String? name = cache.get('name');
```

- 키-값 쌍을 타입 안전하게 저장
- 다양한 타입 조합 가능

---

# -------------------------------------------
# 🎯 실전 예제
# -------------------------------------------

## 예제 1: API 응답 래퍼

```dart
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
```

**사용:**
```dart
ApiResponse<String> response = ApiResponse<String>.success('데이터');
ApiResponse<User> userResponse = ApiResponse<User>.success(user);
```

## 예제 2: 옵셔널 값

```dart
class Optional<T> {
  final T? _value;
  
  Optional.some(this._value);
  Optional.none() : _value = null;
  
  T? get value => _value;
  bool get isSome => _value != null;
}
```

**사용:**
```dart
Optional<int> someValue = Optional<int>.some(42);
Optional<String> noneValue = Optional<String>.none();
```

---

# -------------------------------------------
# ✅ 체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] 제네릭의 필요성을 이해했습니다
- [ ] 제네릭 클래스를 정의할 수 있습니다
- [ ] 제네릭 메서드를 작성할 수 있습니다
- [ ] 여러 타입 파라미터를 사용할 수 있습니다
- [ ] 타입 제약(extends)을 이해했습니다
- [ ] 제네릭과 컬렉션의 관계를 이해했습니다
- [ ] 실전에서 제네릭을 활용할 수 있습니다

---

# -------------------------------------------
# 🚀 실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [Run.md](Run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd ch01_dart_basic
dart run lib/ch06_제네릭/main.dart
```

---

# -------------------------------------------
# 📝 다음 단계
# -------------------------------------------

06단계를 완료했다면 다음 단계로 진행하세요:
- **07단계: 비동기 프로그래밍** - Future, async/await

## 📚 전체 커리큘럼

1. ✅ **01단계: 기본 문법** - 변수, 타입, 함수
2. ✅ **02단계: 제어문** - if/else, switch, for/while
3. ✅ **03단계: 컬렉션** - List, Map, Set
4. ✅ **04단계: Null Safety** - null 안전 처리
5. ✅ **05단계: 클래스와 객체** - 클래스, 생성자, 상속
6. ✅ **06단계: 제네릭** - 타입 파라미터 (현재 단계)
7. ⏭️ **07단계: 비동기 프로그래밍** - Future, async/await
8. ⏭️ **08단계: 함수형 프로그래밍** - 람다, 고차 함수

---

# -------------------------------------------
# 💡 팁
# -------------------------------------------

1. **제네릭 네이밍**
   - `T`: Type (일반적인 타입)
   - `E`: Element (컬렉션 요소)
   - `K`: Key (맵의 키)
   - `V`: Value (맵의 값)
   - `R`: Return (반환 타입)

2. **타입 안정성**
   - 제네릭을 사용하면 컴파일 타임에 타입 체크
   - 런타임 에러 방지
   - IDE 자동완성 지원

3. **실전 활용**
   - 컬렉션: List, Map, Set은 모두 제네릭
   - API 응답: 다양한 데이터 타입 처리
   - 유틸리티 클래스: 재사용 가능한 코드 작성

4. **주의사항**
   - 타입을 명시하면 더 안전
   - 타입 추론도 좋지만, 명시가 더 명확
   - `dynamic` 사용 최소화

