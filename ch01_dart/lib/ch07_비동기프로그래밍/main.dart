// ============================================
// 07단계: 비동기 프로그래밍 예제
// ============================================

void main() async {
  print('==================================================');
  print('07단계: 비동기 프로그래밍 예제');
  print('==================================================');
  
  // ============================================
  // 1. Future 기본
  // ============================================
  print('\n[1. Future 기본]');
  print('------------------------------');
  
  // Future 생성
  Future<String> futureData = fetchData();
  print('Future 생성 완료 (아직 실행 중...)');
  
  // ============================================
  // 2. Future - then 사용
  // ============================================
  print('\n[2. Future - then 사용]');
  print('------------------------------');
  
  fetchData().then((data) {
    print('데이터 받음: $data');
  }).catchError((error) {
    print('에러 발생: $error');
  });
  
  // ============================================
  // 3. async/await 기본
  // ============================================
  print('\n[3. async/await 기본]');
  print('------------------------------');
  
  await loadData();
  
  // ============================================
  // 4. 여러 Future 처리
  // ============================================
  print('\n[4. 여러 Future 처리]');
  print('------------------------------');
  
  // 순차 실행
  print('순차 실행:');
  String data1 = await fetchData1();
  print('  첫 번째 완료: $data1');
  
  String data2 = await fetchData2();
  print('  두 번째 완료: $data2');
  
  // 병렬 실행
  print('\n병렬 실행:');
  var results = await Future.wait([
    fetchData1(),
    fetchData2(),
    fetchData3(),
  ]);
  print('  모든 결과: $results');
  
  // ============================================
  // 5. Future.delayed
  // ============================================
  print('\n[5. Future.delayed]');
  print('------------------------------');
  
  print('3초 후 메시지 출력...');
  await Future.delayed(Duration(seconds: 1));
  print('1초 경과');
  await Future.delayed(Duration(seconds: 1));
  print('2초 경과');
  await Future.delayed(Duration(seconds: 1));
  print('3초 경과 - 완료!');
  
  // ============================================
  // 6. 에러 처리
  // ============================================
  print('\n[6. 에러 처리]');
  print('------------------------------');
  
  try {
    String result = await fetchDataWithError(false);
    print('성공: $result');
  } catch (e) {
    print('에러 캐치: $e');
  }
  
  // ============================================
  // 7. Future.value와 Future.error
  // ============================================
  print('\n[7. Future.value와 Future.error]');
  print('------------------------------');
  
  Future<String> immediateFuture = Future.value('즉시 값');
  String immediateValue = await immediateFuture;
  print('즉시 값: $immediateValue');
  
  try {
    Future<String> errorFuture = Future.error('에러 발생!');
    await errorFuture;
  } catch (e) {
    print('에러: $e');
  }
  
  // ============================================
  // 8. 실전 예제 - 사용자 데이터 로드
  // ============================================
  print('\n[8. 실전 예제 - 사용자 데이터 로드]');
  print('------------------------------');
  
  try {
    User user = await loadUserData(1);
    print('사용자 로드 성공:');
    print('  이름: ${user.name}');
    print('  이메일: ${user.email}');
  } catch (e) {
    print('사용자 로드 실패: $e');
  }
  
  // ============================================
  // 9. 실전 예제 - 여러 API 호출
  // ============================================
  print('\n[9. 실전 예제 - 여러 API 호출]');
  print('------------------------------');
  
  await loadMultipleData();
  
  // ============================================
  // 10. Future.timeout
  // ============================================
  print('\n[10. Future.timeout]');
  print('------------------------------');
  
  try {
    String result = await fetchDataWithTimeout().timeout(
      Duration(seconds: 2),
      onTimeout: () => '타임아웃!',
    );
    print('결과: $result');
  } catch (e) {
    print('에러: $e');
  }
}

// ============================================
// 함수 정의들
// ============================================

// 1. 기본 Future 함수
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  return '데이터 로드 완료';
}

// 2. async/await 함수
Future<void> loadData() async {
  print('데이터 로딩 시작...');
  String data = await fetchData();
  print('데이터 로딩 완료: $data');
}

// 3. 여러 Future 함수들
Future<String> fetchData1() async {
  await Future.delayed(Duration(milliseconds: 500));
  return '데이터 1';
}

Future<String> fetchData2() async {
  await Future.delayed(Duration(milliseconds: 500));
  return '데이터 2';
}

Future<String> fetchData3() async {
  await Future.delayed(Duration(milliseconds: 500));
  return '데이터 3';
}

// 4. 에러 발생 함수
Future<String> fetchDataWithError(bool shouldError) async {
  await Future.delayed(Duration(seconds: 1));
  
  if (shouldError) {
    throw Exception('데이터 로드 실패!');
  }
  
  return '데이터 로드 성공';
}

// 5. 타임아웃 함수
Future<String> fetchDataWithTimeout() async {
  await Future.delayed(Duration(seconds: 3));
  return '데이터';
}

// 6. 사용자 데이터 클래스
class User {
  final int id;
  final String name;
  final String email;
  
  User({required this.id, required this.name, required this.email});
  
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }
}

// 7. 사용자 데이터 로드
Future<User> loadUserData(int userId) async {
  await Future.delayed(Duration(seconds: 1));
  
  // 시뮬레이션: API 호출
  Map<String, dynamic> userData = {
    'id': userId,
    'name': 'Alice',
    'email': 'alice@example.com',
  };
  
  return User.fromMap(userData);
}

// 8. 여러 데이터 로드
Future<void> loadMultipleData() async {
  print('여러 데이터 로딩 시작...');
  
  // 병렬로 로드
  var results = await Future.wait([
    fetchUserProfile(),
    fetchUserPosts(),
    fetchUserFriends(),
  ]);
  
  print('모든 데이터 로드 완료:');
  print('  프로필: ${results[0]}');
  print('  게시물: ${results[1]}');
  print('  친구: ${results[2]}');
}

Future<String> fetchUserProfile() async {
  await Future.delayed(Duration(milliseconds: 800));
  return '프로필 데이터';
}

Future<String> fetchUserPosts() async {
  await Future.delayed(Duration(milliseconds: 600));
  return '게시물 데이터';
}

Future<String> fetchUserFriends() async {
  await Future.delayed(Duration(milliseconds: 700));
  return '친구 데이터';
}

