# ch05-06: Drawer - 코드 설명

## 📚 학습 목표
- Drawer 사용법
- DrawerHeader 사용
- ListTile으로 메뉴 구성

---

## 🔑 중요 코드 설명

### 1. Drawer 구조

```dart
Scaffold(
  drawer: Drawer(
    child: ListView(
      children: [
        DrawerHeader(...),
        ListTile(...),
      ],
    ),
  ),
)
```

**핵심 포인트:**
- `drawer`: Scaffold의 drawer 속성
- 왼쪽에서 오른쪽으로 스와이프로 열림

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] Drawer를 사용할 수 있습니다
- [ ] DrawerHeader를 사용할 수 있습니다

---

## 🚀 실행 방법

```bash
cd ch02_ui
flutter run lib/ch05_네비게이션/ch05-06_drawer.dart
```

