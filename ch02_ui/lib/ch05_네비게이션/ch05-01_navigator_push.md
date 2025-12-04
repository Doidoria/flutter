# ch05-01: Navigator.push - 코드 설명

## 📚 학습 목표
- Navigator.push의 기본 사용법
- MaterialPageRoute 이해
- Navigator.pop으로 뒤로가기

---

## 🔑 중요 코드 설명

### 1. Navigator.push 기본 구조

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SecondPage(),
  ),
);
```

**핵심 포인트:**
- `context`: BuildContext 필요
- `MaterialPageRoute`: 페이지 전환 애니메이션
- `builder`: 새 페이지 위젯 생성

### 2. Navigator.pop

```dart
Navigator.pop(context);
```

**핵심 포인트:**
- 현재 페이지를 닫고 이전 페이지로 돌아감
- 스택에서 제거

---

## 📝 각 라인별 상세 설명

### Navigator.push 예제

```30:40:ch02_ui/lib/ch05_네비게이션/ch05-01_navigator_push.dart
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ),
                );
              },
              child: const Text('두 번째 페이지로 이동'),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 32 | `Navigator.push` - 새 페이지로 이동 |
| 33 | `context` - BuildContext |
| 34 | `MaterialPageRoute` - Material Design 전환 애니메이션 |
| 35 | `builder` - 새 페이지 위젯 생성 함수 |

---

## 💡 핵심 개념 정리

### Navigator 스택

```
[첫 번째 페이지]
    ↓ push
[첫 번째 페이지, 두 번째 페이지]
    ↓ pop
[첫 번째 페이지]
```

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] Navigator.push를 사용할 수 있습니다
- [ ] Navigator.pop을 사용할 수 있습니다
- [ ] MaterialPageRoute를 이해했습니다

---

## 🚀 실행 방법

```bash
cd ch02_ui
flutter run lib/ch05_네비게이션/ch05-01_navigator_push.dart
```

