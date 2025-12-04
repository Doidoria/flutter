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
   dart run lib/ch07_비동기프로그래밍/main.dart
   ```

4. **결과 확인**
   - 터미널에 실행 결과가 출력됩니다
   - 비동기 작업이 순서대로 실행되는 것을 확인할 수 있습니다

**예상 출력:**
```
==================================================
07단계: 비동기 프로그래밍 예제
==================================================

[1. Future 기본]
------------------------------
Future 생성 완료 (아직 실행 중...)
...
```

**주의:** 비동기 작업은 시간이 걸리므로 출력 순서가 예상과 다를 수 있습니다.

---

## 방법 2: VS Code에서 실행

1. **파일 열기**
   - `lib/ch07_비동기프로그래밍/main.dart` 파일을 VS Code에서 엽니다

2. **실행 방법**
   - 방법 A: 파일 상단의 "Run" 버튼 클릭
   - 방법 B: `F5` 키 누르기
   - 방법 C: 우클릭 → "Run Dart" 선택
   - 방법 D: 터미널에서 `dart run lib/ch07_비동기프로그래밍/main.dart` 입력

3. **결과 확인**
   - 하단의 "TERMINAL" 또는 "OUTPUT" 탭에서 결과 확인

---

## 방법 3: Android Studio / IntelliJ에서 실행

1. **파일 열기**
   - `lib/ch07_비동기프로그래밍/main.dart` 파일을 엽니다

2. **실행**
   - 파일 상단의 실행 버튼(▶️) 클릭
   - 또는 `Shift + F10` (Windows) / `Ctrl + R` (Mac)

3. **결과 확인**
   - 하단의 "Run" 탭에서 결과 확인

---

## 방법 4: Flutter 프로젝트로 실행 (웹 브라우저)

```bash
# 웹 브라우저에서 실행
flutter run -d chrome lib/ch07_비동기프로그래밍/main.dart

# 또는 특정 디바이스 선택
flutter devices  # 사용 가능한 디바이스 확인
flutter run -d <device-id> lib/ch07_비동기프로그래밍/main.dart
```

**주의:** Flutter 프로젝트에서는 `print()` 출력이 브라우저 콘솔에 표시됩니다.
- Chrome: `F12` → Console 탭
- 개발자 도구에서 확인 가능

---

## 🔍 결과 확인 팁

1. **비동기 실행 순서**
   - `await`가 있으면 순차 실행
   - `Future.wait`는 병렬 실행
   - 출력 순서를 관찰해보세요

2. **코드 수정 후 재실행**
   ```bash
   # 코드를 수정한 후 다시 실행
   dart run lib/ch07_비동기프로그래밍/main.dart
   ```

3. **지연 시간 조정**
   - `Future.delayed`의 시간을 변경해보세요
   - 병렬 vs 순차 실행의 차이를 확인하세요

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
- `async` 함수에서 `await` 사용 확인
- `main()` 함수에 `async` 추가 확인

---

## 📝 실습: 직접 코드 수정해보기

1. `main.dart` 파일을 엽니다
2. 코드를 수정합니다 (예: 지연 시간 변경, 새로운 비동기 함수 추가)
3. 저장합니다 (`Ctrl + S` / `Cmd + S`)
4. 다시 실행해서 결과를 확인합니다

**예시:**
```dart
// 원본
await Future.delayed(Duration(seconds: 1));

// 수정: 시간 변경
await Future.delayed(Duration(milliseconds: 500));
```

이렇게 수정하고 실행하면 실행 시간이 변경된 것을 확인할 수 있습니다.

