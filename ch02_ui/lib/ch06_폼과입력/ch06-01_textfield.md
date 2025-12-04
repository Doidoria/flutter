# ch06-01: TextField - 코드 설명

## 📚 학습 목표
- TextField 기본 사용법
- InputDecoration으로 스타일 설정
- prefixIcon, suffixIcon 사용

---

## 🔑 중요 코드 설명

### 1. TextField 기본 구조

```dart
TextField(
  decoration: InputDecoration(
    labelText: '이름',
    border: OutlineInputBorder(),
  ),
)
```

**핵심 포인트:**
- `decoration`: 입력 필드 스타일
- `labelText`: 라벨 텍스트
- `border`: 테두리 스타일

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] TextField를 사용할 수 있습니다
- [ ] InputDecoration을 설정할 수 있습니다

---

## 🚀 실행 방법

```bash
cd ch02_ui
flutter run lib/ch06_폼과입력/ch06-01_textfield.dart
```

