# 단계 2: API 서비스 구현

## 🎯 목표
백엔드 서버와 통신하기 위한 기본 API 서비스 클래스를 생성합니다.

## 📝 작업 내용

### 2.1 ApiService 클래스 생성

`lib/services/api_service.dart` 파일을 생성하고 다음 코드를 작성합니다:

```dart
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class ApiService {
  // 백엔드 서버 주소
  static const String baseUrl = 'http://localhost:8090';
  
  // Dio 인스턴스와 쿠키 관리자
  late Dio _dio;
  late CookieJar _cookieJar;

  // 생성자
  ApiService() {
    // 쿠키 저장소 초기화
    _cookieJar = CookieJar();
    
    // Dio 인스턴스 초기화
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
      },
    ));
    
    // 쿠키 관리자 추가 (자동으로 쿠키 저장/전송)
    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  // Dio 인스턴스를 외부에서 사용할 수 있도록 getter 제공
  Dio get dio => _dio;
}
```

## 📖 코드 설명

### 주요 구성 요소

1. **baseUrl**: 백엔드 서버 주소 (포트 8090)
   - 로컬 개발: `http://localhost:8090`
   - 실제 배포 시: 실제 서버 주소로 변경

2. **Dio**: HTTP 클라이언트 라이브러리
   - `BaseOptions`: 기본 설정 (타임아웃, 헤더 등)
   - `connectTimeout`: 연결 타임아웃 (5초)
   - `receiveTimeout`: 응답 수신 타임아웃 (3초)

3. **CookieJar**: 쿠키 저장소
   - 서버에서 받은 쿠키를 자동으로 저장
   - 다음 요청 시 자동으로 쿠키 전송

4. **CookieManager**: Dio 인터셉터
   - 요청/응답 시 쿠키를 자동으로 처리
   - HTTP-only 쿠키도 자동 관리

### 왜 쿠키를 사용하나요?

백엔드에서 JWT 토큰을 HTTP-only 쿠키로 전달하기 때문에:
- 보안: JavaScript에서 접근 불가 (XSS 공격 방지)
- 자동 전송: 매 요청마다 자동으로 쿠키 포함
- 만료 관리: 서버에서 쿠키 만료 시간 설정

## ✅ 확인 사항
- [ ] `lib/services/api_service.dart` 파일이 생성되었는지 확인
- [ ] 코드에 문법 오류가 없는지 확인 (빨간 줄이 없는지 확인)
- [ ] `flutter pub get`로 패키지가 제대로 설치되었는지 확인

## 🔍 문제 해결

### import 오류 발생 시
- `flutter pub get` 명령어를 다시 실행
- IDE를 재시작

### 쿠키가 저장되지 않는 경우
- `CookieManager`가 제대로 추가되었는지 확인
- 백엔드 CORS 설정 확인 (`allowCredentials: true`)

## 📚 다음 단계
다음 단계에서는 인증 서비스를 구현합니다.
→ [단계3: 인증 서비스 구현](./단계3_인증_서비스_구현.md)

