# 단계 9: APK 파일 배포 후 같은 WiFi 내 연결하기 (OPTIONAL)

## 🎯 목표
Flutter 앱을 APK로 빌드하고, 실제 Android 기기에서 같은 WiFi 네트워크를 통해 백엔드 서버에 연결하는 방법을 학습합니다.

## 📋 사전 준비 사항

### 필수 조건
- ✅ Android 기기 (실제 스마트폰 또는 태블릿)
- ✅ 개발자 PC와 Android 기기가 같은 WiFi 네트워크에 연결
- ✅ Android 기기에서 "개발자 옵션" 활성화
- ✅ USB 디버깅 활성화 (또는 무선 디버깅)
- ✅ 백엔드 서버가 실행 중 (PC에서)
- ✅ PC의 로컬 IP 주소 확인

## 📝 작업 내용

### 9.1 PC의 로컬 IP 주소 확인

#### Windows
1. 명령 프롬프트(cmd) 또는 PowerShell 실행
2. 다음 명령어 입력:
```bash
ipconfig
```
3. "IPv4 주소" 찾기 (예: `192.168.0.100`)

#### macOS/Linux
1. 터미널 실행
2. 다음 명령어 입력:
```bash
ifconfig
```
또는
```bash
ip addr show
```
3. WiFi 인터페이스의 IP 주소 찾기 (예: `192.168.0.100`)

### 9.2 백엔드 서버 설정 변경

#### application.properties 수정

`ch04_BN/src/main/resources/application.properties` 파일을 열고 다음을 확인:

```properties
server.port=8090
```

#### SecurityConfig CORS 설정 확인

`ch04_BN/src/main/java/com/example/demo/config/SecurityConfig.java` 파일에서 CORS 설정 확인:

```java
@Bean
CorsConfigurationSource corsConfigurationSource(){
    CorsConfiguration config = new CorsConfiguration();
    config.setAllowedHeaders(Collections.singletonList("*"));
    config.setAllowedMethods(Collections.singletonList("*"));
    // PC의 IP 주소로 변경 (예: http://192.168.0.100:8090)
    config.setAllowedOriginPatterns(Collections.singletonList("http://192.168.0.100:8090"));
    config.setAllowCredentials(true);
    return new CorsConfigurationSource(){
        @Override
        public CorsConfiguration getCorsConfiguration(HttpServletRequest request) {
            return config;
        }
    };
}
```

**중요**: `localhost` 대신 실제 IP 주소를 사용해야 합니다.

### 9.3 Flutter 앱 설정 변경

#### ApiService 수정

`lib/services/api_service.dart` 파일을 열고 `baseUrl`을 수정:

```dart
class ApiService {
  // PC의 로컬 IP 주소로 변경
  // 예: static const String baseUrl = 'http://192.168.0.100:8090';
  static const String baseUrl = 'http://YOUR_PC_IP:8090';
  
  // ... 나머지 코드
}
```

**주의**: `YOUR_PC_IP`를 실제 PC의 IP 주소로 변경하세요.

#### AndroidManifest.xml 권한 설정

실제 기기에서 IP 주소를 가져오기 위해 필요한 권한을 추가해야 합니다.

`android/app/src/main/AndroidManifest.xml` 파일을 열고 다음 권한을 추가:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- 인터넷 및 네트워크 상태 접근 권한 -->
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
    
    <application
        ...
    </application>
</manifest>
```

**중요**: 
- `INTERNET` 권한: 네트워크 인터페이스에 접근하기 위해 필요
- `ACCESS_NETWORK_STATE` 권한: 네트워크 상태 확인을 위해 필요
- 이 권한들이 없으면 실제 기기에서 IP 주소를 가져올 수 없습니다

#### IP 주소 표시 기능

앱의 로그인 및 회원가입 화면 상단에 기기의 IP 주소가 자동으로 표시됩니다.

**구현된 기능**:
- `lib/utils/ip_helper.dart`: 기기 IP 주소를 가져오는 유틸리티
- `lib/screens/login_screen.dart`: 로그인 화면에 IP 주소 표시
- `lib/screens/join_screen.dart`: 회원가입 화면에 IP 주소 표시

**동작 방식**:
1. 앱 실행 시 자동으로 기기의 WiFi IP 주소를 감지
2. 로그인/회원가입 화면 상단에 파란색 정보 박스로 표시
3. WiFi 인터페이스(wlan, wifi, eth)를 우선적으로 탐색
4. IP 주소를 찾을 수 없으면 안내 메시지 표시

### 9.4 방화벽 설정

#### Windows 방화벽
1. Windows 보안 → 방화벽 및 네트워크 보호
2. "고급 설정" 클릭
3. "인바운드 규칙" → "새 규칙"
4. "포트" 선택 → 다음
5. TCP 선택, 특정 로컬 포트: `8090` → 다음
6. "연결 허용" → 다음
7. 모든 프로필 체크 → 다음
8. 이름: "Spring Boot 8090" → 완료

#### macOS 방화벽
1. 시스템 설정 → 네트워크 → 방화벽
2. 방화벽 옵션 → "자동으로 서명된 소프트웨어가 들어오는 연결 허용" 체크

#### Linux 방화벽 (ufw)
```bash
sudo ufw allow 8090/tcp
```

### 9.5 APK 파일 빌드

#### 디버그 APK 빌드

터미널에서 다음 명령어 실행:

```bash
cd ch04_flutter
flutter build apk --debug
```

빌드된 APK 파일 위치:
```
build/app/outputs/flutter-apk/app-debug.apk
```

#### 릴리즈 APK 빌드 (선택사항)

```bash
flutter build apk --release
```

빌드된 APK 파일 위치:
```
build/app/outputs/flutter-apk/app-release.apk
```

### 9.6 APK 파일 설치

#### 방법 1: USB를 통한 설치

1. **Android 기기를 PC에 USB로 연결**
2. **USB 디버깅 활성화**
   - 설정 → 휴대전화 정보 → 빌드 번호 7번 탭
   - 설정 → 개발자 옵션 → USB 디버깅 활성화
3. **ADB를 통한 설치**
   ```bash
   adb install build/app/outputs/flutter-apk/app-debug.apk
   ```

#### 방법 2: 직접 전송 후 설치

1. **APK 파일을 Android 기기로 전송**
   - USB 연결 후 파일 복사
   - 또는 이메일/클라우드 저장소 사용
2. **Android 기기에서 설치**
   - 파일 관리자에서 APK 파일 찾기
   - "알 수 없는 출처에서 설치 허용" 활성화 (필요시)
   - APK 파일 탭하여 설치

### 9.7 백엔드 서버 실행

#### 백엔드 서버 시작

`ch04_BN` 프로젝트에서:

```bash
cd ch04_BN
./gradlew bootRun
```

또는 IDE에서 `DemoApplication` 실행

#### 서버 접속 확인

Android 기기의 브라우저에서:
```
http://YOUR_PC_IP:8090/validate
```

정상 응답이 오면 서버가 정상 작동 중입니다.

### 9.8 앱 실행 및 테스트

1. **앱 실행**
   - Android 기기에서 앱 아이콘 탭
   - 앱이 정상적으로 시작되는지 확인

2. **회원가입 테스트**
   - 회원가입 화면에서 테스트 계정 생성
   - 성공 메시지 확인

3. **로그인 테스트**
   - 생성한 계정으로 로그인
   - 홈 화면으로 이동 확인

4. **사용자 정보 확인**
   - 홈 화면에서 사용자 정보 표시 확인

5. **IP 주소 표시 확인**
   - 로그인 화면 상단에 기기 IP 주소가 표시되는지 확인
   - 회원가입 화면 상단에 기기 IP 주소가 표시되는지 확인
   - 표시된 IP 주소가 실제 기기의 WiFi IP와 일치하는지 확인

## 🔍 문제 해결

### 문제 1: "Connection refused" 또는 "Network error"

**원인**: 
- PC와 Android 기기가 다른 WiFi 네트워크에 연결
- 방화벽이 포트 8090을 차단
- IP 주소가 잘못됨

**해결 방법**:
1. 같은 WiFi 네트워크에 연결되어 있는지 확인
2. PC의 IP 주소가 올바른지 확인 (`ipconfig` 또는 `ifconfig`)
3. 방화벽 설정 확인
4. 백엔드 서버가 실행 중인지 확인

### 문제 2: CORS 오류

**증상**: 브라우저 콘솔에 CORS 관련 에러

**원인**: 백엔드 CORS 설정이 Android 기기의 IP를 허용하지 않음

**해결 방법**:
1. `SecurityConfig`에서 `setAllowedOriginPatterns` 확인
2. 모든 IP 허용 (개발 환경용):
   ```java
   config.setAllowedOriginPatterns(Collections.singletonList("*"));
   ```
3. 또는 특정 IP 범위 허용:
   ```java
   config.setAllowedOriginPatterns(Arrays.asList("http://192.168.0.*:8090"));
   ```

### 문제 3: APK 설치 실패

**원인**: 
- "알 수 없는 출처" 설치 비활성화
- Android 버전 호환성 문제

**해결 방법**:
1. 설정 → 보안 → "알 수 없는 출처에서 설치 허용" 활성화
2. Android 8.0 이상: 설치 시 "이 출처 허용" 선택
3. 최신 Flutter SDK 사용 확인

### 문제 4: 서버에 연결할 수 없음

**원인**: 
- PC의 IP 주소가 변경됨 (DHCP)
- 백엔드 서버가 실행되지 않음

**해결 방법**:
1. PC의 IP 주소 재확인
2. `ApiService`의 `baseUrl` 업데이트
3. 앱 재빌드 및 재설치
4. 백엔드 서버 재시작

### 문제 5: WiFi IP 주소가 자주 변경됨

**해결 방법**:

#### 방법 1: 고정 IP 설정 (권장)

**Windows**:
1. 네트워크 설정 → 어댑터 옵션 변경
2. WiFi 어댑터 우클릭 → 속성
3. "인터넷 프로토콜 버전 4(TCP/IPv4)" 선택 → 속성
4. "다음 IP 주소 사용" 선택
5. 고정 IP 주소 입력 (예: `192.168.0.100`)
6. 서브넷 마스크: `255.255.255.0`
7. 기본 게이트웨이: 라우터 IP (예: `192.168.0.1`)

**macOS**:
1. 시스템 설정 → 네트워크
2. WiFi 선택 → 고급
3. TCP/IP 탭 → "수동으로 구성" 선택
4. 고정 IP 주소 입력

#### 방법 2: 환경 변수 사용

`ApiService`를 수정하여 환경 변수에서 IP 읽기:

```dart
class ApiService {
  static String get baseUrl {
    // 환경 변수에서 IP 읽기, 없으면 기본값 사용
    const String? ip = String.fromEnvironment('SERVER_IP');
    if (ip != null && ip.isNotEmpty) {
      return 'http://$ip:8090';
    }
    return 'http://192.168.0.100:8090'; // 기본값
  }
  
  // ... 나머지 코드
}
```

빌드 시 IP 지정:
```bash
flutter build apk --dart-define=SERVER_IP=192.168.0.100
```

### 문제 6: 실제 기기에서 IP 주소가 표시되지 않음

**증상**: 
- 에뮬레이터에서는 IP 주소가 정상적으로 표시됨 (예: `10.0.0.1`)
- 실제 기기에서는 "IP 주소를 가져올 수 없습니다" 메시지 표시

**원인**:
1. `AndroidManifest.xml`에 `INTERNET` 및 `ACCESS_NETWORK_STATE` 권한이 없음
2. Android 10+ 보안 정책으로 인한 네트워크 인터페이스 접근 제한
3. WiFi 인터페이스 탐색 실패

**해결 방법**:

1. **AndroidManifest.xml 권한 확인**
   ```xml
   <manifest xmlns:android="http://schemas.android.com/apk/res/android">
       <uses-permission android:name="android.permission.INTERNET"/>
       <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
       ...
   </manifest>
   ```

2. **앱 재빌드**
   ```bash
   flutter clean
   flutter build apk
   ```

3. **재설치**
   - 기존 앱 삭제 후 새로 빌드한 APK 재설치

4. **WiFi 연결 확인**
   - 기기가 WiFi에 연결되어 있는지 확인
   - 모바일 데이터만 활성화된 경우 IP 주소를 가져올 수 없을 수 있음

5. **IP Helper 로직 확인**
   - `lib/utils/ip_helper.dart` 파일이 올바르게 구현되어 있는지 확인
   - WiFi 인터페이스(wlan, wifi, eth)를 우선적으로 탐색하도록 설정되어 있는지 확인

**참고**: 
- 에뮬레이터와 실제 기기의 네트워크 환경이 다르므로, 실제 기기에서 테스트하는 것이 중요합니다
- Android 10 이상에서는 네트워크 인터페이스 접근이 더 엄격하게 제한됩니다

## 📱 추가 팁

### 개발 중 빠른 테스트

개발 중에는 USB 디버깅을 사용하여 직접 실행:

```bash
flutter run
```

이 방법은 APK 빌드 없이 바로 테스트할 수 있습니다.

### 무선 디버깅 (Android 11+)

1. Android 기기와 PC가 같은 WiFi에 연결
2. Android 기기에서:
   - 설정 → 개발자 옵션 → 무선 디버깅 활성화
   - 무선 디버깅 → 페어링 코드로 페어링
3. PC에서:
   ```bash
   adb pair <IP>:<PORT>
   adb connect <IP>:<PORT>
   ```

### 네트워크 상태 확인

Android 기기에서 PC에 접속 가능한지 확인:

1. 터미널 앱 설치 (예: Termux)
2. 다음 명령어 실행:
   ```bash
   ping YOUR_PC_IP
   ```
3. 또는 브라우저에서:
   ```
   http://YOUR_PC_IP:8090/validate
   ```

## ✅ 확인 사항

- [ ] PC의 IP 주소를 확인했는가?
- [ ] 백엔드 서버의 CORS 설정을 수정했는가?
- [ ] `ApiService`의 `baseUrl`을 수정했는가?
- [ ] 방화벽 설정을 완료했는가?
- [ ] APK 파일을 빌드했는가?
- [ ] Android 기기에 APK를 설치했는가?
- [ ] 같은 WiFi 네트워크에 연결되어 있는가?
- [ ] 백엔드 서버가 실행 중인가?
- [ ] 앱이 정상적으로 작동하는가?
- [ ] `AndroidManifest.xml`에 `INTERNET` 및 `ACCESS_NETWORK_STATE` 권한이 추가되었는가?
- [ ] 로그인/회원가입 화면에 기기 IP 주소가 정상적으로 표시되는가?

## 🎉 완료!

축하합니다! APK 파일을 빌드하고 실제 Android 기기에서 테스트할 수 있게 되었습니다.

## 📚 참고 자료

- [Flutter APK 빌드 가이드](https://docs.flutter.dev/deployment/android)
- [Android ADB 사용법](https://developer.android.com/studio/command-line/adb)
- [Spring Boot CORS 설정](https://spring.io/guides/gs/rest-service-cors/)

## ⚠️ 주의사항

1. **보안**: 개발 환경에서만 `*` 와일드카드를 사용하세요. 프로덕션에서는 특정 도메인만 허용해야 합니다.

2. **IP 주소**: DHCP를 사용하는 경우 IP 주소가 변경될 수 있습니다. 고정 IP 사용을 권장합니다.

3. **방화벽**: 프로덕션 환경에서는 방화벽 규칙을 신중하게 설정하세요.

4. **HTTPS**: 프로덕션 환경에서는 반드시 HTTPS를 사용해야 합니다.

