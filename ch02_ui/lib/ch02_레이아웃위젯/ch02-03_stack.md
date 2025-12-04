# ch02-03: Stack - 코드 설명

## 📚 학습 목표
- Stack의 개념과 사용법
- Positioned를 사용한 위치 지정
- 오버레이 효과 구현
- 배지(Badge) 효과 구현

---

## 🔑 중요 코드 설명

### 1. Stack 기본 구조

```dart
Stack(
  children: [
    Container(...),  // 뒤쪽
    Container(...),  // 앞쪽
  ],
)
```

**핵심 포인트:**
- 위젯을 겹쳐서 배치
- 나중에 선언된 위젯이 위에 표시
- Positioned로 정확한 위치 지정 가능

### 2. Positioned 사용

```dart
Stack(
  children: [
    Container(...),
    Positioned(
      top: 20,
      left: 20,
      child: Container(...),
    ),
  ],
)
```

**핵심 포인트:**
- `top`, `bottom`, `left`, `right`로 위치 지정
- Stack 내부에서만 사용 가능

---

## 📝 각 라인별 상세 설명

### Stack 예제 1: 기본

```76:98:ch02_ui/lib/ch02_레이아웃위젯/ch02-03_stack.dart
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue.shade300,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.green.shade300,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.red.shade300,
                  ),
                ],
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 76 | `SizedBox` - Stack의 크기 제한 |
| 79 | `Stack` - 위젯을 겹쳐서 배치 |
| 80-85 | 첫 번째 Container (뒤쪽, 파란색) |
| 86-90 | 두 번째 Container (중간, 초록색) |
| 91-95 | 세 번째 Container (앞쪽, 빨간색) |

**핵심:** 나중에 선언된 위젯이 위에 표시됩니다.

---

### Stack 예제 2: Positioned 사용

```112:152:ch02_ui/lib/ch02_레이아웃위젯/ch02-03_stack.dart
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue.shade300,
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.green.shade300,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red.shade300,
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Stack 예제',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 122 | `Positioned` - 위치 지정 위젯 |
| 123 | `top: 20` - 위에서 20px |
| 124 | `left: 20` - 왼쪽에서 20px |
| 131 | `Positioned` - 두 번째 위치 지정 |
| 132 | `bottom: 20` - 아래에서 20px |
| 133 | `right: 20` - 오른쪽에서 20px |
| 140 | `Center` - 중앙 정렬 (Stack 내부) |

**Positioned 속성:**
- `top`: 위에서 거리
- `bottom`: 아래에서 거리
- `left`: 왼쪽에서 거리
- `right`: 오른쪽에서 거리

---

### Stack 예제 3: 이미지 위에 텍스트 오버레이

```166:209:ch02_ui/lib/ch02_레이아웃위젯/ch02-03_stack.dart
            SizedBox(
              width: 200,
              height: 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.image,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: const Text(
                        '이미지 제목',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 170 | `fit: StackFit.expand` - Stack을 부모 크기에 맞춤 |
| 183 | `Positioned` - 텍스트 오버레이 |
| 184-186 | `bottom: 0, left: 0, right: 0` - 아래쪽 전체 너비 |
| 190 | `color: Colors.black.withOpacity(0.6)` - 반투명 검정색 |

---

### Stack 예제 4: 배지(Badge) 효과

```223:262:ch02_ui/lib/ch02_레이아웃위젯/ch02-03_stack.dart
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.notifications,
                      size: 80,
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 241 | `Positioned` - 배지 위치 (우측 상단) |
| 242 | `top: 10` - 위에서 10px |
| 243 | `right: 10` - 오른쪽에서 10px |
| 247 | `shape: BoxShape.circle` - 원형 모양 |

---

## 💡 핵심 개념 정리

### Stack의 fit 속성

```dart
Stack(
  fit: StackFit.expand,  // 부모 크기에 맞춤
  children: [...],
)
```

**StackFit 종류:**
- `loose`: 기본값, 자식 위젯 크기에 맞춤
- `expand`: 부모 크기에 맞춤
- `passthrough`: 부모 제약 전달

### Positioned의 위치 지정

```dart
Positioned(
  top: 10,      // 위에서 10px
  left: 20,      // 왼쪽에서 20px
  right: 30,    // 오른쪽에서 30px
  bottom: 40,   // 아래에서 40px
  child: ...,
)
```

**주의:** `left`와 `right`를 동시에 사용하면 너비가 결정됩니다.

---

## 🎯 실전 팁

### 1. 오버레이 패턴

```dart
Stack(
  children: [
    Image(...),  // 배경 이미지
    Positioned(
      bottom: 0,
      child: Container(...),  // 오버레이
    ),
  ],
)
```

### 2. 배지 패턴

```dart
Stack(
  children: [
    Icon(...),  // 메인 아이콘
    Positioned(
      top: 0,
      right: 0,
      child: Container(...),  // 배지
    ),
  ],
)
```

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] Stack의 기본 사용법을 이해했습니다
- [ ] Positioned를 사용할 수 있습니다
- [ ] 오버레이 효과를 구현할 수 있습니다
- [ ] 배지 효과를 구현할 수 있습니다
- [ ] Stack의 fit 속성을 이해했습니다

---

## 🚀 실행 방법

```bash
cd ch02_ui
flutter run lib/ch02_레이아웃위젯/ch02-03_stack.dart
```

