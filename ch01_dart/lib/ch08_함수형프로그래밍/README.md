# -------------------------------------------
# 08단계: 함수형 프로그래밍
# -------------------------------------------

## 학습 목표

이 단계에서는 Dart의 함수형 프로그래밍을 학습합니다:
- 람다 함수 (익명 함수)
- 고차 함수
- 컬렉션 메서드 (map, where, forEach, reduce, fold 등)
- 함수 체이닝
- 실전 활용 예제

---

# -------------------------------------------
# 1. 람다 함수 (익명 함수)
# -------------------------------------------

## 1.1 화살표 함수

```dart
var add = (int a, int b) => a + b;
```

- `=>`: 화살표 함수
- 단일 표현식만 있는 함수
- 간결한 코드 작성

## 1.2 익명 함수

```dart
var multiply = (int a, int b) {
  return a * b;
};
```

- 이름 없는 함수
- 변수에 할당 가능
- 여러 줄 코드 가능

## 1.3 함수를 변수로

```dart
void Function(String) printer = (String text) {
  print(text);
};
```

- 함수도 객체
- 변수에 저장 가능
- 매개변수로 전달 가능

---

# -------------------------------------------
# 2. 고차 함수
# -------------------------------------------

## 2.1 함수를 매개변수로 받는 함수

```dart
void processList(List<int> numbers, void Function(int) action) {
  for (int num in numbers) {
    action(num);
  }
}

// 사용
processList([1, 2, 3], (num) => print(num * 2));
```

- 함수를 매개변수로 받음
- 유연한 코드 작성
- 동작을 외부에서 정의

## 2.2 함수를 반환하는 함수

```dart
Function makeMultiplier(int multiplier) {
  return (int value) => value * multiplier;
}

var doubleIt = makeMultiplier(2);
print(doubleIt(5));  // 10
```

- 함수를 반환
- 클로저 개념
- 팩토리 패턴에 유용

---

# -------------------------------------------
# 3. map - 변환
# -------------------------------------------

## 3.1 기본 사용법

```dart
List<int> numbers = [1, 2, 3, 4, 5];
List<int> doubled = numbers.map((n) => n * 2).toList();
// [2, 4, 6, 8, 10]
```

- 각 요소를 변환
- 새로운 리스트 생성
- 원본 리스트는 변경되지 않음

## 3.2 다양한 변환

```dart
// 숫자를 문자열로
List<String> strings = numbers.map((n) => '숫자$n').toList();

// 객체 변환
List<User> users = names.map((name) => User(name)).toList();
```

---

# -------------------------------------------
# 4. where - 필터링
# -------------------------------------------

## 4.1 기본 사용법

```dart
List<int> numbers = [1, 2, 3, 4, 5, 6];
List<int> evens = numbers.where((n) => n % 2 == 0).toList();
// [2, 4, 6]
```

- 조건에 맞는 요소만 선택
- 필터링에 사용
- 원본 리스트는 변경되지 않음

## 4.2 다양한 필터링

```dart
// 5보다 큰 수
List<int> greater = numbers.where((n) => n > 5).toList();

// null이 아닌 값
List<String?> nullable = ['a', null, 'b'];
List<String> nonNull = nullable.where((s) => s != null).cast<String>().toList();
```

---

# -------------------------------------------
# 5. forEach - 순회
# -------------------------------------------

## 5.1 기본 사용법

```dart
List<String> fruits = ['apple', 'banana', 'orange'];
fruits.forEach((fruit) {
  print(fruit);
});
```

- 각 요소에 대해 실행
- 반환값 없음
- 부수 효과(side effect)에 사용

## 5.2 인덱스와 함께 순회

```dart
fruits.asMap().forEach((index, fruit) {
  print('[$index] $fruit');
});
```

---

# -------------------------------------------
# 6. reduce - 축약
# -------------------------------------------

## 6.1 기본 사용법

```dart
List<int> numbers = [1, 2, 3, 4, 5];
int sum = numbers.reduce((a, b) => a + b);
// 15
```

- 모든 요소를 하나의 값으로 축약
- 초기값 없음 (첫 번째 요소가 초기값)
- 빈 리스트면 에러 발생

## 6.2 다양한 축약

```dart
// 최대값
int max = numbers.reduce((a, b) => a > b ? a : b);

// 최소값
int min = numbers.reduce((a, b) => a < b ? a : b);
```

---

# -------------------------------------------
# 7. fold - 초기값과 함께 축약
# -------------------------------------------

## 7.1 기본 사용법

```dart
List<int> numbers = [1, 2, 3, 4, 5];
int product = numbers.fold(1, (a, b) => a * b);
// 120
```

- 초기값 제공
- 빈 리스트도 안전
- reduce보다 유연

## 7.2 다양한 활용

```dart
// 문자열 연결
List<String> words = ['Hello', 'World'];
String sentence = words.fold('', (a, b) => '$a $b');

// 리스트 평탄화
List<List<int>> nested = [[1, 2], [3, 4]];
List<int> flat = nested.fold([], (a, b) => [...a, ...b]);
```

---

# -------------------------------------------
# 8. any - 조건 만족하는 요소 존재 여부
# -------------------------------------------

## 8.1 기본 사용법

```dart
List<int> numbers = [1, 2, 3, 4, 5];
bool hasEven = numbers.any((n) => n % 2 == 0);
// true
```

- 하나라도 조건 만족하면 true
- 빈 리스트면 false
- 조기 종료 (효율적)

---

# -------------------------------------------
# 9. every - 모든 요소가 조건 만족 여부
# -------------------------------------------

## 9.1 기본 사용법

```dart
List<int> numbers = [2, 4, 6, 8];
bool allEven = numbers.every((n) => n % 2 == 0);
// true
```

- 모든 요소가 조건 만족하면 true
- 하나라도 불만족하면 false
- 빈 리스트면 true

---

# -------------------------------------------
# 10. firstWhere, lastWhere
# -------------------------------------------

## 10.1 firstWhere

```dart
List<int> numbers = [1, 2, 3, 4, 5];
int firstEven = numbers.firstWhere((n) => n % 2 == 0);
// 2
```

- 조건에 맞는 첫 번째 요소
- 없으면 에러 (orElse 제공 가능)

## 10.2 lastWhere

```dart
int lastEven = numbers.lastWhere((n) => n % 2 == 0);
// 4
```

- 조건에 맞는 마지막 요소

---

# -------------------------------------------
# 11. take, skip
# -------------------------------------------

## 11.1 take

```dart
List<int> numbers = [1, 2, 3, 4, 5];
List<int> first3 = numbers.take(3).toList();
// [1, 2, 3]
```

- 처음 N개 요소 선택

## 11.2 skip

```dart
List<int> rest = numbers.skip(3).toList();
// [4, 5]
```

- 처음 N개 요소 건너뛰기

---

# -------------------------------------------
# 🎯 실전 예제
# -------------------------------------------

## 예제 1: 함수 체이닝

```dart
List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

int result = numbers
    .where((n) => n % 2 == 0)  // 짝수만
    .map((n) => n * 2)          // 2배
    .reduce((a, b) => a + b);   // 합계
```

- 여러 메서드를 연속으로 호출
- 읽기 쉬운 코드
- 함수형 스타일

## 예제 2: 사용자 데이터 처리

```dart
List<Map<String, dynamic>> users = [
  {'name': 'Alice', 'score': 95},
  {'name': 'Bob', 'score': 87},
];

// 90점 이상 사용자 이름
List<String> highScorers = users
    .where((user) => user['score'] >= 90)
    .map((user) => user['name'] as String)
    .toList();
```

## 예제 3: 복잡한 변환

```dart
List<String> sentences = ['Hello world', 'Dart programming'];

List<String> allWords = sentences
    .map((s) => s.split(' '))
    .expand((words) => words)
    .map((word) => word.toUpperCase())
    .toList();
```

---

# -------------------------------------------
# ✅ 체크리스트
# -------------------------------------------

이 단계를 완료했다면 다음을 확인하세요:

- [ ] 람다 함수를 작성할 수 있습니다
- [ ] 고차 함수를 이해하고 사용할 수 있습니다
- [ ] map으로 리스트를 변환할 수 있습니다
- [ ] where로 리스트를 필터링할 수 있습니다
- [ ] forEach로 리스트를 순회할 수 있습니다
- [ ] reduce와 fold를 사용할 수 있습니다
- [ ] any와 every를 사용할 수 있습니다
- [ ] 함수 체이닝을 할 수 있습니다

---

# -------------------------------------------
# 🚀 실행 방법 및 결과 확인
# -------------------------------------------

자세한 실행 방법은 [Run.md](Run.md) 파일을 참고하세요.

**빠른 실행:**
```bash
cd ch01_dart_basic
dart run lib/ch08_함수형프로그래밍/main.dart
```

---

# -------------------------------------------
# 📝 커리큘럼 완료
# -------------------------------------------

축하합니다! 🎉 모든 단계를 완료했습니다!

## 📚 전체 커리큘럼

1. ✅ **01단계: 기본 문법** - 변수, 타입, 함수
2. ✅ **02단계: 제어문** - if/else, switch, for/while
3. ✅ **03단계: 컬렉션** - List, Map, Set
4. ✅ **04단계: Null Safety** - null 안전 처리
5. ✅ **05단계: 클래스와 객체** - 클래스, 생성자, 상속
6. ✅ **06단계: 제네릭** - 타입 파라미터
7. ✅ **07단계: 비동기 프로그래밍** - Future, async/await
8. ✅ **08단계: 함수형 프로그래밍** - 람다, 고차 함수 (현재 단계)

---

# -------------------------------------------
# 💡 팁
# -------------------------------------------

1. **함수형 vs 명령형**
   - 함수형: map, where 등 사용 (선언적)
   - 명령형: for 루프 사용 (절차적)
   - 상황에 맞게 선택

2. **성능 고려**
   - 체이닝은 여러 번 순회할 수 있음
   - 성능이 중요하면 for 루프 고려
   - 대부분의 경우 함수형이 충분히 빠름

3. **가독성**
   - 함수형이 더 읽기 쉬운 경우 많음
   - 의도가 명확하게 드러남
   - Flutter에서 자주 사용

4. **실전 활용**
   - API 응답 처리: map, where
   - 데이터 변환: 체이닝
   - 필터링: where
   - 집계: reduce, fold

