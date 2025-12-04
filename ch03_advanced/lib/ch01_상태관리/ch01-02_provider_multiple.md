# ch01-02: 여러 상태 관리 - 코드 설명

## 📚 학습 목표
- 하나의 Provider에 여러 상태 관리
- 여러 Consumer 사용
- 상태 분리 방법

---

## 🔑 중요 코드 설명

### 여러 상태 관리

```dart
class CounterProvider extends ChangeNotifier {
  int _count = 0;
  String _message = '안녕하세요!';
  
  int get count => _count;
  String get message => _message;
  
  void changeMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }
}
```

**핵심 포인트:**
- 하나의 Provider에 여러 상태 포함 가능
- 각 상태별로 Consumer 사용

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] 하나의 Provider에 여러 상태를 관리할 수 있습니다
- [ ] 여러 Consumer를 사용할 수 있습니다

---

## 🚀 실행 방법

```bash
cd ch03_advanced
flutter run lib/ch01_상태관리/ch01-02_provider_multiple.dart
```

