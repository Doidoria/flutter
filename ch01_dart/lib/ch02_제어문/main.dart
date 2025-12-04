// ============================================
// 02단계: 제어문 예제
// ============================================

void main() {
  print('==================================================');
  print('02단계: 제어문 예제');
  print('==================================================');
  
  // ============================================
  // 1. 조건문 (if-else)
  // ============================================
  print('\n[1. 조건문 - if/else]');
  print('------------------------------');
  
  // 기본 if-else
  int score = 85;
  print('점수: $score');
  
  if (score >= 90) {
    print('등급: A');
  } else if (score >= 80) {
    print('등급: B');
  } else if (score >= 70) {
    print('등급: C');
  } else {
    print('등급: F');
  }
  
  // 여러 조건 예제
  int age = 20;
  print('\n나이: $age');
  if (age < 13) {
    print('어린이');
  } else if (age < 20) {
    print('청소년');
  } else if (age < 65) {
    print('성인');
  } else {
    print('노인');
  }
  
  // ============================================
  // 2. 삼항 연산자
  // ============================================
  print('\n[2. 삼항 연산자]');
  print('------------------------------');
  
  int score2 = 75;
  String grade = score2 >= 60 ? '합격' : '불합격';
  print('점수: $score2 → 결과: $grade');
  
  // 중첩 삼항 연산자
  int temperature = 25;
  String weather = temperature > 30 
      ? '더움' 
      : temperature > 20 
          ? '따뜻함' 
          : '시원함';
  print('온도: ${temperature}도 → 날씨: $weather');
  
  // ============================================
  // 3. switch-case
  // ============================================
  print('\n[3. switch-case]');
  print('------------------------------');
  
  String day = 'Monday';
  print('요일: $day');
  
  switch (day) {
    case 'Monday':
      print('한 주의 시작!');
      break;
    case 'Tuesday':
    case 'Wednesday':
    case 'Thursday':
      print('평일입니다');
      break;
    case 'Friday':
      print('주말이 다가옵니다!');
      break;
    case 'Saturday':
    case 'Sunday':
      print('주말입니다!');
      break;
    default:
      print('알 수 없는 요일');
  }
  
  // 숫자 switch 예제
  int month = 3;
  print('\n월: $month');
  switch (month) {
    case 12:
    case 1:
    case 2:
      print('계절: 겨울');
      break;
    case 3:
    case 4:
    case 5:
      print('계절: 봄');
      break;
    case 6:
    case 7:
    case 8:
      print('계절: 여름');
      break;
    case 9:
    case 10:
    case 11:
      print('계절: 가을');
      break;
    default:
      print('잘못된 월');
  }
  
  // ============================================
  // 4. for 루프
  // ============================================
  print('\n[4. for 루프]');
  print('------------------------------');
  
  // 기본 for 루프
  print('기본 for 루프:');
  for (int i = 0; i < 5; i++) {
    print('  i = $i');
  }
  
  // 역순 for 루프
  print('\n역순 for 루프:');
  for (int i = 5; i > 0; i--) {
    print('  i = $i');
  }
  
  // 2씩 증가
  print('\n2씩 증가하는 for 루프:');
  for (int i = 0; i < 10; i += 2) {
    print('  i = $i');
  }
  
  // ============================================
  // 5. for-in 루프
  // ============================================
  print('\n[5. for-in 루프]');
  print('------------------------------');
  
  // 리스트 순회
  List<String> fruits = ['apple', 'banana', 'orange', 'grape'];
  print('과일 리스트:');
  for (String fruit in fruits) {
    print('  - $fruit');
  }
  
  // 숫자 리스트 순회
  List<int> numbers = [10, 20, 30, 40, 50];
  print('\n숫자 리스트:');
  int sum = 0;
  for (int number in numbers) {
    sum += number;
    print('  $number (합계: $sum)');
  }
  print('최종 합계: $sum');
  
  // ============================================
  // 6. while 루프
  // ============================================
  print('\n[6. while 루프]');
  print('------------------------------');
  
  int count = 0;
  print('카운트 다운:');
  while (count < 5) {
    print('  카운트: $count');
    count++;
  }
  print('최종 카운트: $count');
  
  // 조건이 false가 될 때까지 반복
  int number = 10;
  print('\n숫자 나누기:');
  while (number > 1) {
    print('  현재 숫자: $number');
    number ~/= 2; // 정수 나눗셈
  }
  print('최종 숫자: $number');
  
  // ============================================
  // 7. do-while 루프
  // ============================================
  print('\n[7. do-while 루프]');
  print('------------------------------');
  
  // do-while은 최소 한 번은 실행됨
  int num = 0;
  print('do-while 예제:');
  do {
    print('  num = $num');
    num++;
  } while (num < 5);
  
  // 조건이 false여도 한 번 실행
  int value = 10;
  print('\n조건이 false인 경우:');
  do {
    print('  value = $value (한 번은 실행됨)');
    value++;
  } while (value < 5);
  
  // ============================================
  // 8. break와 continue
  // ============================================
  print('\n[8. break와 continue]');
  print('------------------------------');
  
  // break: 루프 종료
  print('break 예제 (5에서 종료):');
  for (int i = 0; i < 10; i++) {
    if (i == 5) {
      break; // 루프 종료
    }
    print('  i = $i');
  }
  
  // continue: 다음 반복으로 건너뛰기
  print('\ncontinue 예제 (짝수만 출력):');
  for (int i = 0; i < 10; i++) {
    if (i % 2 != 0) {
      continue; // 홀수는 건너뛰기
    }
    print('  짝수: $i');
  }
  
  // ============================================
  // 9. 중첩 루프
  // ============================================
  print('\n[9. 중첩 루프]');
  print('------------------------------');
  
  // 구구단 예제
  print('구구단 (2단~3단):');
  for (int i = 2; i <= 3; i++) {
    print('  $i단:');
    for (int j = 1; j <= 9; j++) {
      print('    $i x $j = ${i * j}');
    }
  }
  
  // 별 찍기 예제
  print('\n별 찍기:');
  for (int i = 1; i <= 5; i++) {
    String stars = '';
    for (int j = 0; j < i; j++) {
      stars += '*';
    }
    print('  $stars');
  }
  
  // ============================================
  // 10. 실전 예제
  // ============================================
  print('\n[10. 실전 예제]');
  print('------------------------------');
  
  // 점수 등급 계산 함수
  printGrade(95);
  printGrade(85);
  printGrade(75);
  printGrade(65);
  
  // 숫자 찾기
  List<int> numbers2 = [1, 3, 5, 7, 9, 11, 13];
  int target = 7;
  findNumber(numbers2, target);
  
  // 팩토리얼 계산
  int n = 5;
  int factorial = calculateFactorial(n);
  print('\n팩토리얼:');
  print('  $n! = $factorial');
}

// ============================================
// 함수 정의들
// ============================================

// 점수 등급 출력 함수
void printGrade(int score) {
  String grade;
  if (score >= 90) {
    grade = 'A';
  } else if (score >= 80) {
    grade = 'B';
  } else if (score >= 70) {
    grade = 'C';
  } else if (score >= 60) {
    grade = 'D';
  } else {
    grade = 'F';
  }
  print('점수: $score → 등급: $grade');
}

// 숫자 찾기 함수
void findNumber(List<int> numbers, int target) {
  print('\n숫자 찾기:');
  print('  리스트: $numbers');
  print('  찾는 숫자: $target');
  
  bool found = false;
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] == target) {
      print('  찾았습니다! 인덱스: $i');
      found = true;
      break;
    }
  }
  
  if (!found) {
    print('  찾을 수 없습니다.');
  }
}

// 팩토리얼 계산 함수
int calculateFactorial(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}

