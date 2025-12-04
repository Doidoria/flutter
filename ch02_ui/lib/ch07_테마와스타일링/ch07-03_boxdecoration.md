# ch07-03: BoxDecoration - 코드 설명

## 📚 학습 목표
- BoxDecoration 사용법
- 그라데이션 적용
- 그림자 효과

---

## 🔑 중요 코드 설명

### 1. 그라데이션

```dart
decoration: BoxDecoration(
  gradient: LinearGradient(
    colors: [Colors.blue, Colors.purple],
  ),
)
```

**핵심 포인트:**
- `LinearGradient`: 선형 그라데이션
- `colors`: 색상 리스트

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] BoxDecoration을 사용할 수 있습니다
- [ ] 그라데이션을 적용할 수 있습니다
- [ ] 그림자 효과를 만들 수 있습니다

---

## 🚀 실행 방법

```bash
cd ch02_ui
flutter run lib/ch07_테마와스타일링/ch07-03_boxdecoration.dart
```

