// ============================================
// 04단계: Null Safety 예제
// ============================================

void main() {
  print('==================================================');
  print('04단계: Null Safety 예제');
  print('==================================================');
  
  // ============================================
  // 1. Nullable vs Non-nullable
  // ============================================
  print('\n[1. Nullable vs Non-nullable]');
  print('------------------------------');
  
  // Non-nullable (null 불가능)
  String name = 'Flutter';
  // name = null;  // 에러! null 할당 불가
  
  // Nullable (null 가능)
  String? nullableName;
  nullableName = 'Dart';
  nullableName = null;  // 가능
  
  print('Non-nullable name: $name');
  print('Nullable name: $nullableName');
  
  // ============================================
  // 2. Null 체크
  // ============================================
  print('\n[2. Null 체크]');
  print('------------------------------');
  
  String? text = 'Hello';
  
  // if 문으로 null 체크
  if (text != null) {
    print('텍스트 길이: ${text.length}');
  } else {
    print('텍스트가 null입니다');
  }
  
  // null 할당 후 체크
  text = null;
  if (text != null) {
    print('텍스트 길이: ${text.length}');
  } else {
    print('텍스트가 null입니다');
  }
  
  // ============================================
  // 3. Null 안전 연산자 (?.)
  // ============================================
  print('\n[3. Null 안전 연산자 (?.)]');
  print('------------------------------');
  
  String? message;
  
  // ?. 연산자: null이면 null 반환, 아니면 메서드 실행
  int? length = message?.length;
  print('message?.length: $length');
  
  message = 'Hello World';
  length = message?.length;
  print('message?.length (값 있을 때): $length');
  
  // 체이닝
  String? userName;
  int? nameLength = userName?.toUpperCase().length;
  print('userName?.toUpperCase().length: $nameLength');
  
  userName = 'flutter';
  nameLength = userName?.toUpperCase().length;
  print('userName?.toUpperCase().length (값 있을 때): $nameLength');
  
  // ============================================
  // 4. Null 병합 연산자 (??)
  // ============================================
  print('\n[4. Null 병합 연산자 (??)]');
  print('------------------------------');
  
  String? nullableValue;
  
  // ?? 연산자: null이면 오른쪽 값 사용
  String result = nullableValue ?? '기본값';
  print('nullableValue ?? "기본값": $result');
  
  nullableValue = '실제값';
  result = nullableValue ?? '기본값';
  print('nullableValue ?? "기본값" (값 있을 때): $result');
  
  // 숫자 예제
  int? count;
  int total = count ?? 0;
  print('count ?? 0: $total');
  
  count = 10;
  total = count ?? 0;
  print('count ?? 0 (값 있을 때): $total');
  
  // ============================================
  // 5. Null 단언 연산자 (!)
  // ============================================
  print('\n[5. Null 단언 연산자 (!)]');
  print('------------------------------');
  
  String? maybeNull = 'Hello';
  
  // ! 연산자: null이 아님을 보장 (위험!)
  String definitelyNotNull = maybeNull!;
  print('maybeNull!: $definitelyNotNull');
  
  // 주의: null이면 런타임 에러 발생
  // String? nullValue = null;
  // String error = nullValue!;  // 런타임 에러!
  
  // ============================================
  // 6. Null 체크 패턴
  // ============================================
  print('\n[6. Null 체크 패턴]');
  print('------------------------------');
  
  // 패턴 1: if-else
  String? value1 = 'test';
  if (value1 != null) {
    print('값이 있습니다: $value1');
  }
  
  // 패턴 2: ?. 와 ?? 조합
  String? value2;
  String safeValue = value2?.toUpperCase() ?? 'DEFAULT';
  print('안전한 값: $safeValue');
  
  // 패턴 3: 함수에서 null 체크
  printLength('Hello');
  printLength(null);
  
  // ============================================
  // 7. List와 Map에서의 Null Safety
  // ============================================
  print('\n[7. List와 Map에서의 Null Safety]');
  print('------------------------------');
  
  // List의 nullable 요소
  List<String?> nullableList = ['apple', null, 'banana', null];
  print('Nullable List: $nullableList');
  
  for (String? item in nullableList) {
    if (item != null) {
      print('  - $item');
    } else {
      print('  - (null)');
    }
  }
  
  // Map의 nullable 값
  Map<String, int?> nullableMap = {
    'Alice': 95,
    'Bob': null,
    'Charlie': 88,
  };
  
  print('\nNullable Map:');
  nullableMap.forEach((name, score) {
    String scoreText = score != null ? '$score점' : '점수 없음';
    print('  $name: $scoreText');
  });
  
  // ============================================
  // 8. 함수에서 Null Safety
  // ============================================
  print('\n[8. 함수에서 Null Safety]');
  print('------------------------------');
  
  // Nullable 매개변수
  greetUser('Alice');
  greetUser(null);
  
  // Nullable 반환값
  String? findName(List<String> names, String target) {
    for (String name in names) {
      if (name == target) {
        return name;
      }
    }
    return null;  // 찾지 못하면 null 반환
  }
  
  List<String> names = ['Alice', 'Bob', 'Charlie'];
  String? found = findName(names, 'Bob');
  print('\n찾기 결과: ${found ?? "없음"}');
  
  found = findName(names, 'David');
  print('찾기 결과: ${found ?? "없음"}');
  
  // ============================================
  // 9. 실전 예제
  // ============================================
  print('\n[9. 실전 예제]');
  print('------------------------------');
  
  // 예제 1: 사용자 정보 처리
  Map<String, String?> userInfo = {
    'name': 'Alice',
    'email': 'alice@example.com',
    'phone': null,
  };
  
  print('사용자 정보:');
  print('  이름: ${userInfo['name'] ?? '없음'}');
  print('  이메일: ${userInfo['email'] ?? '없음'}');
  print('  전화번호: ${userInfo['phone'] ?? '없음'}');
  
  // 예제 2: 안전한 계산
  int? a = 10;
  int? b = null;
  int? c = 20;
  
  int? sum = (a ?? 0) + (b ?? 0) + (c ?? 0);
  print('\n안전한 계산:');
  print('  a: $a, b: $b, c: $c');
  print('  합계: $sum');
  
  // 예제 3: 리스트에서 null 필터링
  List<int?> numbers = [1, null, 3, null, 5];
  List<int> nonNullNumbers = [];
  
  for (int? num in numbers) {
    if (num != null) {
      nonNullNumbers.add(num);
    }
  }
  
  print('\nNull 필터링:');
  print('  원본: $numbers');
  print('  필터링 후: $nonNullNumbers');
}

// ============================================
// 함수 정의들
// ============================================

// Nullable 매개변수를 받는 함수
void printLength(String? text) {
  // 방법 1: if 체크
  if (text != null) {
    print('텍스트 길이: ${text.length}');
  } else {
    print('텍스트가 null입니다');
  }
  
  // 방법 2: ?. 와 ?? 사용
  int length = text?.length ?? 0;
  print('안전한 길이: $length');
}

// Nullable 매개변수와 기본값
void greetUser(String? name) {
  String greeting = 'Hello, ${name ?? 'Guest'}!';
  print(greeting);
}

