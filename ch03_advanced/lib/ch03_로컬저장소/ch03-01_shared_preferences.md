# ch03-01: SharedPreferences - 코드 설명

## 📚 학습 목표
- SharedPreferences 기본 사용법
- 키-값 저장
- 데이터 읽기/쓰기/삭제

---

## 🔑 중요 코드 설명

### SharedPreferences 사용

```dart
// 인스턴스 가져오기
final prefs = await SharedPreferences.getInstance();

// 저장
await prefs.setString('key', 'value');

// 읽기
String? value = prefs.getString('key');

// 삭제
await prefs.remove('key');
```

**핵심 포인트:**
- `getInstance()`: 비동기 메서드
- `setString()`, `getString()`: 문자열 저장/읽기
- 다른 타입도 지원 (setInt, setBool 등)

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] SharedPreferences를 사용할 수 있습니다
- [ ] 데이터를 저장하고 읽을 수 있습니다

---

## 🚀 실행 방법

```bash
cd ch03_advanced
flutter run lib/ch03_로컬저장소/ch03-01_shared_preferences.dart
```

