# ch03-05: FloatingActionButton - 코드 설명

## 📚 학습 목표
- FloatingActionButton의 기본 사용법
- Scaffold에서의 배치
- 크기와 색상 커스터마이징
- Extended FloatingActionButton

---

## 🔑 중요 코드 설명

### 1. 기본 FloatingActionButton

```dart
FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
)
```

**핵심 포인트:**
- 원형 버튼
- 주요 액션에 사용
- Scaffold의 `floatingActionButton` 속성에 배치

### 2. Scaffold에서 사용

```dart
Scaffold(
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
)
```

**핵심 포인트:**
- 우측 하단에 기본 위치
- 화면에 떠있는 형태

---

## 📝 각 라인별 상세 설명

### 예제 1: 기본 FloatingActionButton

```67:75:ch02_ui/lib/ch03_기본UI위젯/ch03-05_floating_action_button.dart
            Container(
              height: 100,
              alignment: Alignment.center,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 70 | `FloatingActionButton` - 떠있는 액션 버튼 |
| 71 | `onPressed` - 클릭 이벤트 |
| 72 | `child` - 버튼 내용 (보통 Icon) |

---

### 예제 4: 크기가 다른 FloatingActionButton

```118:131:ch02_ui/lib/ch03_기본UI위젯/ch03-05_floating_action_button.dart
            Row(
              children: [
                FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 16),
                FloatingActionButton.large(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ],
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 122 | `FloatingActionButton.small` - 작은 크기 |
| 127 | `FloatingActionButton` - 기본 크기 |
| 132 | `FloatingActionButton.large` - 큰 크기 |

---

### 예제 5: Extended FloatingActionButton

```137:143:ch02_ui/lib/ch03_기본UI위젯/ch03-05_floating_action_button.dart
            FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('추가하기'),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 137 | `FloatingActionButton.extended` - 확장형 버튼 |
| 139 | `icon` - 아이콘 |
| 140 | `label` - 텍스트 |

---

## 💡 핵심 개념 정리

### FloatingActionButton 크기

- `FloatingActionButton.small`: 작은 크기
- `FloatingActionButton`: 기본 크기
- `FloatingActionButton.large`: 큰 크기

### Scaffold에서의 위치

```dart
Scaffold(
  floatingActionButton: FloatingActionButton(...),
  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // 기본값
)
```

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] FloatingActionButton을 사용할 수 있습니다
- [ ] Scaffold에 배치할 수 있습니다
- [ ] 크기와 색상을 커스터마이징할 수 있습니다
- [ ] Extended FloatingActionButton을 사용할 수 있습니다

---

## 🚀 실행 방법

```bash
cd ch02_ui
flutter run lib/ch03_기본UI위젯/ch03-05_floating_action_button.dart
```

