# -------------------------------------------
# 🚀 실행 방법 및 결과 확인
# -------------------------------------------

## 방법 1: 터미널에서 Dart로 실행 (권장)

1. **터미널 열기**
   - Windows: PowerShell 또는 CMD
   - Mac/Linux: Terminal

2. **프로젝트 디렉토리로 이동**
   ```bash
   cd C:\Users\Administrator\Downloads\MY\FLUTTER\ch01_dart_basic
   ```

3. **코드 실행**
   ```bash
   dart run lib/ch01_기본문법/main.dart
   ```

4. **결과 확인**
   - 터미널에 실행 결과가 출력됩니다
   - 각 예제의 결과를 순서대로 확인할 수 있습니다

**예상 출력:**
```
==================================================
01단계: 기본 문법 예제
==================================================

[1. 변수 선언]
------------------------------
var name = Flutter (타입 추론)
var age = 25 (타입 추론)
...
```

---

## 방법 2: VS Code에서 실행

1. **파일 열기**
   - `lib/ch01_기본문법/main.dart` 파일을 VS Code에서 엽니다

2. **실행 방법**
   - 방법 A: 파일 상단의 "Run" 버튼 클릭
   - 방법 B: `F5` 키 누르기
   - 방법 C: 우클릭 → "Run Dart" 선택
   - 방법 D: 터미널에서 `dart run lib/ch01_기본문법/main.dart` 입력

3. **결과 확인**
   - 하단의 "TERMINAL" 또는 "OUTPUT" 탭에서 결과 확인

---

## 방법 3: Android Studio / IntelliJ에서 실행

1. **파일 열기**
   - `lib/ch01_기본문법/main.dart` 파일을 엽니다

2. **실행**
   - 파일 상단의 실행 버튼(▶️) 클릭
   - 또는 `Shift + F10` (Windows) / `Ctrl + R` (Mac)

3. **결과 확인**
   - 하단의 "Run" 탭에서 결과 확인

---

## 방법 4: Flutter 프로젝트로 실행 (웹 브라우저)

```bash
# 웹 브라우저에서 실행
flutter run -d chrome lib/ch01_기본문법/main.dart

# 또는 특정 디바이스 선택
flutter devices  # 사용 가능한 디바이스 확인
flutter run -d <device-id> lib/ch01_기본문법/main.dart
```

**주의:** Flutter 프로젝트에서는 `print()` 출력이 브라우저 콘솔에 표시됩니다.
- Chrome: `F12` → Console 탭
- 개발자 도구에서 확인 가능

---

## 🔍 결과 확인 팁

1. **터미널 출력 확인**
   - 모든 `print()` 문의 결과가 순서대로 출력됩니다
   - 각 섹션별로 구분되어 표시됩니다

2. **코드 수정 후 재실행**
   ```bash
   # 코드를 수정한 후 다시 실행
   dart run lib/ch01_기본문법/main.dart
   ```

3. **특정 부분만 실행하고 싶을 때**
   - 코드에서 원하는 부분만 주석 해제하고 실행
   - 또는 새로운 `main()` 함수를 만들어서 테스트

---

## ❌ 문제 해결

### 문제 1: "dart: command not found"

```bash
# Flutter SDK가 설치되어 있다면
flutter pub get
# 또는 Dart SDK 경로 확인
where dart  # Windows
which dart  # Mac/Linux
```

### 문제 2: "File not found"

```bash
# 현재 위치 확인
pwd  # Mac/Linux
cd   # Windows

# 올바른 경로로 이동
cd ch01_dart_basic
```

### 문제 3: "Analysis errors"

- IDE에서 빨간 줄이 보이면 코드에 오류가 있을 수 있습니다
- 오류 메시지를 확인하고 수정하세요

---

## 📝 실습: 직접 코드 수정해보기

1. `main.dart` 파일을 엽니다
2. 코드를 수정합니다 (예: 변수 값 변경)
3. 저장합니다 (`Ctrl + S` / `Cmd + S`)
4. 다시 실행해서 결과를 확인합니다

**예시:**
```dart
// 원본
var name = 'Flutter';

// 수정
var name = 'Dart Programming';
```

이렇게 수정하고 실행하면 출력 결과가 변경된 것을 확인할 수 있습니다.

