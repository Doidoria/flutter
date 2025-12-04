// ============================================
// 08단계: 함수형 프로그래밍 예제
// ============================================

void main() {
  print('==================================================');
  print('08단계: 함수형 프로그래밍 예제');
  print('==================================================');
  
  // ============================================
  // 1. 람다 함수 (익명 함수)
  // ============================================
  print('\n[1. 람다 함수]');
  print('------------------------------');
  
  // 화살표 함수
  var add = (int a, int b) => a + b;
  print('add(10, 20): ${add(10, 20)}');
  
  // 익명 함수
  var multiply = (int a, int b) {
    return a * b;
  };
  print('multiply(5, 6): ${multiply(5, 6)}');
  
  // 함수를 변수로
  void Function(String) printer = (String text) {
    print('  출력: $text');
  };
  printer('Hello Dart!');
  
  // ============================================
  // 2. 고차 함수
  // ============================================
  print('\n[2. 고차 함수]');
  print('------------------------------');
  
  // 함수를 매개변수로 받는 함수
  void processList(List<int> numbers, void Function(int) action) {
    for (int num in numbers) {
      action(num);
    }
  }
  
  List<int> numbers = [1, 2, 3, 4, 5];
  print('리스트 처리:');
  processList(numbers, (num) => print('  숫자: $num'));
  
  // 함수를 반환하는 함수
  Function makeMultiplier(int multiplier) {
    return (int value) => value * multiplier;
  }
  
  var doubleIt = makeMultiplier(2);
  var tripleIt = makeMultiplier(3);
  
  print('\n함수 생성기:');
  print('  doubleIt(5): ${doubleIt(5)}');
  print('  tripleIt(5): ${tripleIt(5)}');
  
  // ============================================
  // 3. map - 변환
  // ============================================
  print('\n[3. map - 변환]');
  print('------------------------------');
  
  List<int> numbers2 = [1, 2, 3, 4, 5];
  print('원본: $numbers2');
  
  // 각 요소를 2배로
  List<int> doubled = numbers2.map((n) => n * 2).toList();
  print('2배: $doubled');
  
  // 문자열로 변환
  List<String> strings = numbers2.map((n) => '숫자$n').toList();
  print('문자열: $strings');
  
  // ============================================
  // 4. where - 필터링
  // ============================================
  print('\n[4. where - 필터링]');
  print('------------------------------');
  
  List<int> numbers3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print('원본: $numbers3');
  
  // 짝수만 필터링
  List<int> evens = numbers3.where((n) => n % 2 == 0).toList();
  print('짝수: $evens');
  
  // 5보다 큰 수만
  List<int> greaterThan5 = numbers3.where((n) => n > 5).toList();
  print('5보다 큰 수: $greaterThan5');
  
  // ============================================
  // 5. forEach - 순회
  // ============================================
  print('\n[5. forEach - 순회]');
  print('------------------------------');
  
  List<String> fruits = ['apple', 'banana', 'orange'];
  print('forEach 순회:');
  fruits.forEach((fruit) {
    print('  - $fruit');
  });
  
  // 인덱스와 함께 순회
  fruits.asMap().forEach((index, fruit) {
    print('  [$index] $fruit');
  });
  
  // ============================================
  // 6. reduce - 축약
  // ============================================
  print('\n[6. reduce - 축약]');
  print('------------------------------');
  
  List<int> numbers4 = [1, 2, 3, 4, 5];
  print('원본: $numbers4');
  
  // 합계
  int sum = numbers4.reduce((a, b) => a + b);
  print('합계: $sum');
  
  // 최대값
  int max = numbers4.reduce((a, b) => a > b ? a : b);
  print('최대값: $max');
  
  // 최소값
  int min = numbers4.reduce((a, b) => a < b ? a : b);
  print('최소값: $min');
  
  // ============================================
  // 7. fold - 초기값과 함께 축약
  // ============================================
  print('\n[7. fold - 초기값과 함께 축약]');
  print('------------------------------');
  
  List<int> numbers5 = [1, 2, 3, 4, 5];
  print('원본: $numbers5');
  
  // 곱셈 (초기값 1)
  int product = numbers5.fold(1, (a, b) => a * b);
  print('곱셈: $product');
  
  // 문자열 연결 (초기값 '')
  List<String> words = ['Hello', 'World', 'Dart'];
  String sentence = words.fold('', (a, b) => a.isEmpty ? b : '$a $b');
  print('문자열 연결: $sentence');
  
  // ============================================
  // 8. any - 조건 만족하는 요소 존재 여부
  // ============================================
  print('\n[8. any - 조건 만족하는 요소 존재 여부]');
  print('------------------------------');
  
  List<int> numbers6 = [1, 2, 3, 4, 5];
  print('원본: $numbers6');
  
  bool hasEven = numbers6.any((n) => n % 2 == 0);
  print('짝수가 있나? $hasEven');
  
  bool hasNegative = numbers6.any((n) => n < 0);
  print('음수가 있나? $hasNegative');
  
  // ============================================
  // 9. every - 모든 요소가 조건 만족 여부
  // ============================================
  print('\n[9. every - 모든 요소가 조건 만족 여부]');
  print('------------------------------');
  
  List<int> numbers7 = [2, 4, 6, 8, 10];
  print('원본: $numbers7');
  
  bool allEven = numbers7.every((n) => n % 2 == 0);
  print('모두 짝수인가? $allEven');
  
  bool allPositive = numbers7.every((n) => n > 0);
  print('모두 양수인가? $allPositive');
  
  // ============================================
  // 10. firstWhere, lastWhere - 조건에 맞는 요소 찾기
  // ============================================
  print('\n[10. firstWhere, lastWhere]');
  print('------------------------------');
  
  List<int> numbers8 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print('원본: $numbers8');
  
  // 첫 번째 짝수
  int firstEven = numbers8.firstWhere((n) => n % 2 == 0);
  print('첫 번째 짝수: $firstEven');
  
  // 마지막 5보다 큰 수
  int lastGreater = numbers8.lastWhere((n) => n > 5);
  print('마지막 5보다 큰 수: $lastGreater');
  
  // ============================================
  // 11. take, skip - 요소 선택
  // ============================================
  print('\n[11. take, skip]');
  print('------------------------------');
  
  List<int> numbers9 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print('원본: $numbers9');
  
  // 처음 3개
  List<int> first3 = numbers9.take(3).toList();
  print('처음 3개: $first3');
  
  // 처음 3개 건너뛰고 나머지
  List<int> skip3 = numbers9.skip(3).toList();
  print('3개 건너뛰고: $skip3');
  
  // ============================================
  // 12. 실전 예제 - 체이닝
  // ============================================
  print('\n[12. 실전 예제 - 체이닝]');
  print('------------------------------');
  
  List<int> numbers10 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print('원본: $numbers10');
  
  // 짝수만 필터링 → 2배 → 합계
  int result = numbers10
      .where((n) => n % 2 == 0)  // 짝수만
      .map((n) => n * 2)          // 2배
      .reduce((a, b) => a + b);   // 합계
  
  print('짝수만 2배해서 합계: $result');
  
  // ============================================
  // 13. 실전 예제 - 사용자 데이터 처리
  // ============================================
  print('\n[13. 실전 예제 - 사용자 데이터 처리]');
  print('------------------------------');
  
  List<Map<String, dynamic>> users = [
    {'name': 'Alice', 'age': 25, 'score': 95},
    {'name': 'Bob', 'age': 30, 'score': 87},
    {'name': 'Charlie', 'age': 28, 'score': 92},
    {'name': 'David', 'age': 35, 'score': 78},
  ];
  
  // 90점 이상인 사용자 이름
  List<String> highScorers = users
      .where((user) => user['score'] >= 90)
      .map((user) => user['name'] as String)
      .toList();
  
  print('90점 이상 사용자: $highScorers');
  
  // 평균 점수
  double averageScore = users
      .map((user) => user['score'] as int)
      .reduce((a, b) => a + b) / users.length;
  
  print('평균 점수: ${averageScore.toStringAsFixed(1)}');
  
  // ============================================
  // 14. 실전 예제 - 복잡한 변환
  // ============================================
  print('\n[14. 실전 예제 - 복잡한 변환]');
  print('------------------------------');
  
  List<String> sentences = [
    'Hello world',
    'Dart programming',
    'Flutter development',
  ];
  
  // 모든 단어를 대문자로 변환하고 평탄화
  List<String> allWords = sentences
      .map((sentence) => sentence.split(' '))
      .expand((words) => words)
      .map((word) => word.toUpperCase())
      .toList();
  
  print('원본: $sentences');
  print('모든 단어 대문자: $allWords');
}

