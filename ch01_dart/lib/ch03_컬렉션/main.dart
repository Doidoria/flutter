// ============================================
// 03단계: 컬렉션 예제
// ============================================

void main() {
  print('==================================================');
  print('03단계: 컬렉션 예제');
  print('==================================================');
  
  // ============================================
  // 1. List (리스트) - 기본
  // ============================================
  print('\n[1. List - 기본]');
  print('------------------------------');
  
  // 리스트 생성
  List<String> fruits = ['apple', 'banana', 'orange'];
  var numbers = [1, 2, 3, 4, 5];
  
  print('과일 리스트: $fruits');
  print('숫자 리스트: $numbers');
  
  // 리스트 접근
  print('\n리스트 접근:');
  print('  첫 번째 과일: ${fruits[0]}');
  print('  마지막 숫자: ${numbers[numbers.length - 1]}');
  print('  리스트 길이: ${fruits.length}');
  
  // ============================================
  // 2. List - 요소 추가/제거
  // ============================================
  print('\n[2. List - 요소 추가/제거]');
  print('------------------------------');
  
  List<String> fruits2 = ['apple', 'banana'];
  print('원본: $fruits2');
  
  // 추가
  fruits2.add('orange');
  print('add 후: $fruits2');
  
  fruits2.addAll(['grape', 'mango']);
  print('addAll 후: $fruits2');
  
  fruits2.insert(1, 'kiwi');
  print('insert(1, kiwi) 후: $fruits2');
  
  // 제거
  fruits2.remove('banana');
  print('remove(banana) 후: $fruits2');
  
  fruits2.removeAt(0);
  print('removeAt(0) 후: $fruits2');
  
  fruits2.removeLast();
  print('removeLast() 후: $fruits2');
  
  // ============================================
  // 3. List - 검색 및 확인
  // ============================================
  print('\n[3. List - 검색 및 확인]');
  print('------------------------------');
  
  List<int> numbers2 = [10, 20, 30, 40, 50];
  print('리스트: $numbers2');
  
  print('  contains(30): ${numbers2.contains(30)}');
  print('  contains(100): ${numbers2.contains(100)}');
  print('  indexOf(30): ${numbers2.indexOf(30)}');
  print('  isEmpty: ${numbers2.isEmpty}');
  print('  isNotEmpty: ${numbers2.isNotEmpty}');
  
  // ============================================
  // 4. List - 순회
  // ============================================
  print('\n[4. List - 순회]');
  print('------------------------------');
  
  List<String> colors = ['red', 'green', 'blue'];
  
  // for-in 루프
  print('for-in 루프:');
  for (String color in colors) {
    print('  - $color');
  }
  
  // forEach
  print('\nforEach:');
  colors.forEach((color) {
    print('  - $color');
  });
  
  // 인덱스와 함께 순회
  print('\n인덱스와 함께 순회:');
  for (int i = 0; i < colors.length; i++) {
    print('  [$i] ${colors[i]}');
  }
  
  // ============================================
  // 5. Map (맵) - 기본
  // ============================================
  print('\n[5. Map - 기본]');
  print('------------------------------');
  
  // Map 생성
  Map<String, int> scores = {
    'Alice': 95,
    'Bob': 87,
    'Charlie': 92,
  };
  
  print('점수 맵: $scores');
  print('  Alice의 점수: ${scores['Alice']}');
  print('  맵 크기: ${scores.length}');
  
  // ============================================
  // 6. Map - 요소 추가/수정/제거
  // ============================================
  print('\n[6. Map - 요소 추가/수정/제거]');
  print('------------------------------');
  
  Map<String, String> users = {
    'user1': 'Alice',
    'user2': 'Bob',
  };
  print('원본: $users');
  
  // 추가/수정
  users['user3'] = 'Charlie';
  print('추가 후: $users');
  
  users['user1'] = 'Alice Updated';
  print('수정 후: $users');
  
  // 제거
  users.remove('user2');
  print('제거 후: $users');
  
  users.clear();
  print('clear() 후: $users');
  
  // ============================================
  // 7. Map - 검색 및 확인
  // ============================================
  print('\n[7. Map - 검색 및 확인]');
  print('------------------------------');
  
  Map<String, int> ages = {
    'Alice': 25,
    'Bob': 30,
    'Charlie': 28,
  };
  
  print('나이 맵: $ages');
  print('  containsKey(Alice): ${ages.containsKey('Alice')}');
  print('  containsValue(30): ${ages.containsValue(30)}');
  print('  isEmpty: ${ages.isEmpty}');
  print('  keys: ${ages.keys}');
  print('  values: ${ages.values}');
  
  // ============================================
  // 8. Map - 순회
  // ============================================
  print('\n[8. Map - 순회]');
  print('------------------------------');
  
  Map<String, int> prices = {
    'apple': 1000,
    'banana': 2000,
    'orange': 1500,
  };
  
  // forEach
  print('forEach:');
  prices.forEach((item, price) {
    print('  $item: \$$price');
  });
  
  // entries 순회
  print('\nentries 순회:');
  for (var entry in prices.entries) {
    print('  ${entry.key}: \$${entry.value}');
  }
  
  // keys 순회
  print('\nkeys 순회:');
  for (var key in prices.keys) {
    print('  $key: \$${prices[key]}');
  }
  
  // ============================================
  // 9. Set (집합) - 기본
  // ============================================
  print('\n[9. Set - 기본]');
  print('------------------------------');
  
  // Set 생성
  Set<String> uniqueNames = {'Alice', 'Bob', 'Charlie'};
  var numbers3 = <int>{1, 2, 3, 4, 5};
  
  print('이름 Set: $uniqueNames');
  print('숫자 Set: $numbers3');
  print('  Set 크기: ${uniqueNames.length}');
  
  // ============================================
  // 10. Set - 요소 추가/제거
  // ============================================
  print('\n[10. Set - 요소 추가/제거]');
  print('------------------------------');
  
  Set<String> fruits3 = {'apple', 'banana'};
  print('원본: $fruits3');
  
  // 추가
  fruits3.add('orange');
  print('add 후: $fruits3');
  
  fruits3.addAll(['grape', 'mango']);
  print('addAll 후: $fruits3');
  
  // 중복 추가 시도 (변화 없음)
  fruits3.add('apple');
  print('중복 추가 시도 후: $fruits3 (변화 없음)');
  
  // 제거
  fruits3.remove('banana');
  print('remove 후: $fruits3');
  
  // ============================================
  // 11. Set - 집합 연산
  // ============================================
  print('\n[11. Set - 집합 연산]');
  print('------------------------------');
  
  Set<int> set1 = {1, 2, 3, 4, 5};
  Set<int> set2 = {4, 5, 6, 7, 8};
  
  print('Set1: $set1');
  print('Set2: $set2');
  
  // 교집합
  print('  교집합: ${set1.intersection(set2)}');
  
  // 합집합
  print('  합집합: ${set1.union(set2)}');
  
  // 차집합
  print('  차집합 (set1 - set2): ${set1.difference(set2)}');
  print('  차집합 (set2 - set1): ${set2.difference(set1)}');
  
  // ============================================
  // 12. Set - 검색 및 확인
  // ============================================
  print('\n[12. Set - 검색 및 확인]');
  print('------------------------------');
  
  Set<String> colors2 = {'red', 'green', 'blue'};
  print('Set: $colors2');
  
  print('  contains(red): ${colors2.contains('red')}');
  print('  contains(yellow): ${colors2.contains('yellow')}');
  print('  isEmpty: ${colors2.isEmpty}');
  print('  length: ${colors2.length}');
  
  // ============================================
  // 13. 실전 예제
  // ============================================
  print('\n[13. 실전 예제]');
  print('------------------------------');
  
  // 예제 1: 학생 점수 관리
  print('예제 1: 학생 점수 관리');
  Map<String, List<int>> studentScores = {
    'Alice': [90, 85, 92],
    'Bob': [78, 82, 80],
    'Charlie': [95, 88, 90],
  };
  
  studentScores.forEach((name, scores) {
    double average = scores.reduce((a, b) => a + b) / scores.length;
    print('  $name: 평균 ${average.toStringAsFixed(1)}점');
  });
  
  // 예제 2: 중복 제거
  print('\n예제 2: 중복 제거');
  List<int> numbersWithDuplicates = [1, 2, 2, 3, 3, 3, 4, 5];
  print('  원본: $numbersWithDuplicates');
  Set<int> uniqueNumbers = numbersWithDuplicates.toSet();
  print('  중복 제거: $uniqueNumbers');
  
  // 예제 3: 리스트 필터링
  print('\n예제 3: 리스트 필터링');
  List<int> numbers4 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<int> evenNumbers = [];
  for (int num in numbers4) {
    if (num % 2 == 0) {
      evenNumbers.add(num);
    }
  }
  print('  원본: $numbers4');
  print('  짝수만: $evenNumbers');
  
  // 예제 4: 맵에서 최대값 찾기
  print('\n예제 4: 맵에서 최대값 찾기');
  Map<String, int> sales = {
    'January': 100,
    'February': 150,
    'March': 120,
    'April': 200,
  };
  
  String maxMonth = '';
  int maxValue = 0;
  sales.forEach((month, value) {
    if (value > maxValue) {
      maxValue = value;
      maxMonth = month;
    }
  });
  print('  판매 데이터: $sales');
  print('  최대 판매월: $maxMonth (${maxValue}개)');
}

