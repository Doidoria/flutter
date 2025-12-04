# ch01-01: Provider 기본 - 코드 설명

## 📚 학습 목표
- Provider 패키지 기본 사용법
- ChangeNotifier 이해
- Consumer 위젯 사용
- notifyListeners() 이해

---

## 🔑 중요 코드 설명

### 1. ChangeNotifierProvider 설정

```dart
ChangeNotifierProvider(
  create: (_) => CounterProvider(),
  child: MyApp(),
)
```

**핵심 포인트:**
- `create`: Provider 인스턴스 생성
- 최상위에서 설정하여 하위 위젯에서 접근 가능

### 2. ChangeNotifier 클래스

```dart
class CounterProvider extends ChangeNotifier {
  int _count = 0;
  
  int get count => _count;
  
  void increment() {
    _count++;
    notifyListeners(); // UI 업데이트 알림
  }
}
```

**핵심 포인트:**
- `ChangeNotifier`: 상태 변경 알림 클래스
- `notifyListeners()`: 상태 변경 시 호출

### 3. Consumer 위젯

```dart
Consumer<CounterProvider>(
  builder: (context, provider, child) {
    return Text('${provider.count}');
  },
)
```

**핵심 포인트:**
- `Consumer`: 상태 구독 위젯
- 상태 변경 시 자동으로 rebuild

---

## 📝 각 라인별 상세 설명

### Provider 클래스

```30:56:ch03_advanced/lib/ch01_상태관리/ch01-01_provider_basic.dart
// Provider: 상태 관리 클래스
class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // UI 업데이트 알림
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 31 | `ChangeNotifier` - 상태 변경 알림 클래스 상속 |
| 32 | `_count` - private 상태 변수 |
| 34 | `get count` - 외부에서 접근 가능한 getter |
| 37 | `increment()` - 증가 메서드 |
| 39 | `notifyListeners()` - 상태 변경 알림 |

---

## 💡 핵심 개념 정리

### Provider 패턴

1. **ChangeNotifier**: 상태 변경 알림
2. **ChangeNotifierProvider**: Provider 제공
3. **Consumer**: 상태 구독
4. **notifyListeners()**: UI 업데이트 트리거

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] ChangeNotifierProvider를 설정할 수 있습니다
- [ ] ChangeNotifier 클래스를 만들 수 있습니다
- [ ] Consumer를 사용할 수 있습니다
- [ ] notifyListeners()를 이해했습니다

---

## 🚀 실행 방법

```bash
cd ch03_advanced
flutter run lib/ch01_상태관리/ch01-01_provider_basic.dart
```

