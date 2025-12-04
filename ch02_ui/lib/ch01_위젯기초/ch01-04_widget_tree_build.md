# ch01-04: 위젯 트리와 build() 메서드 코드 설명

## 📚 학습 목표
- 위젯 트리 구조 이해
- build() 메서드의 동작 원리
- setState()와 build()의 관계
- 위젯 계층 구조 시각화

---

## 🔑 중요 코드 설명

### 1. 위젯 트리 구조

```
MaterialApp
└── Scaffold
    ├── AppBar
    └── Body
        └── SingleChildScrollView
            └── Column
                └── 여러 위젯들...
```

**핵심 포인트:**
- 부모-자식 관계
- 단일 루트 위젯
- 중첩 가능한 구조

### 2. build() 메서드 호출 추적

```dart
int _buildCount = 0;

@override
Widget build(BuildContext context) {
  _buildCount++;  // build() 호출 시마다 증가
  return Scaffold(...);
}
```

**동작:**
- `build()`가 호출될 때마다 `_buildCount` 증가
- `setState()` 호출 시 `build()` 자동 실행
- UI 업데이트 확인 가능

---

## 📝 각 라인별 상세 설명

### 전체 코드 구조

```1:21:ch02_ui/lib/ch01_위젯기초/ch01-04_widget_tree_build.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '01-04: 위젯 트리와 build() 메서드',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const WidgetTreePage(),
    );
  }
}
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 1 | Flutter Material 라이브러리 import |
| 3-5 | `main()` 함수 - 앱 진입점 |
| 7 | `MyApp` - 루트 위젯 |
| 12 | `MaterialApp` - Material Design 앱 루트 |
| 15 | `seedColor: Colors.purple` - 보라색 테마 |
| 18 | `home` - 시작 페이지로 `WidgetTreePage` 설정 |

---

### StatefulWidget 정의

```23:28:ch02_ui/lib/ch01_위젯기초/ch01-04_widget_tree_build.dart
class WidgetTreePage extends StatefulWidget {
  const WidgetTreePage({super.key});

  @override
  State<WidgetTreePage> createState() => _WidgetTreePageState();
}
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 23 | `WidgetTreePage` - StatefulWidget 클래스 |
| 27 | `createState()` - State 객체 생성 |

---

### State 클래스 - build() 호출 추적

```30:38:ch02_ui/lib/ch01_위젯기초/ch01-04_widget_tree_build.dart
class _WidgetTreePageState extends State<WidgetTreePage> {
  int _counter = 0;
  int _buildCount = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 30 | `_WidgetTreePageState` - State 클래스 |
| 31 | `int _counter` - 카운터 상태 변수 |
| 32 | `int _buildCount` - build() 호출 횟수 추적 변수 |
| 34-38 | `_incrementCounter()` - 카운터 증가 메서드 |
| 35 | `setState()` - 상태 변경 및 UI 업데이트 |

**핵심 개념:**
- `_buildCount`: `build()` 메서드가 호출된 횟수를 추적
- `setState()` 호출 시 `build()`가 자동 실행됨

---

### build() 메서드 - 호출 추적

```40:209:ch02_ui/lib/ch01_위젯기초/ch01-04_widget_tree_build.dart
  @override
  Widget build(BuildContext context) {
    // build() 메서드가 호출될 때마다 카운트 증가
    _buildCount++;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('01-04: 위젯 트리와 build() 메서드'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 위젯 트리 구조 설명
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '위젯 트리 구조',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildWidgetTree(),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // build() 메서드 설명
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'build() 메서드 특징',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 위젯을 반환합니다'),
                  Text('• setState() 호출 시 자동 실행됩니다'),
                  Text('• 빠르게 실행되어야 합니다'),
                  Text('• 순수 함수처럼 동작해야 합니다'),
                  Text('• 무거운 작업은 피해야 합니다'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // setState() 동작 원리
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'setState() 동작 원리',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('1. 상태가 변경됩니다'),
                  const Text('2. build() 메서드가 호출됩니다'),
                  const Text('3. UI가 다시 그려집니다'),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '현재 카운터: $_counter',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'build() 호출 횟수: $_buildCount',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '※ setState()를 호출할 때마다 build()가 실행됩니다',
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _incrementCounter,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('카운터 증가 (build() 호출 확인)'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 위젯 트리의 특징
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '위젯 트리의 특징',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 단일 루트: 하나의 루트 위젯'),
                  Text('• 중첩 가능: 위젯 안에 위젯'),
                  Text('• 재사용 가능: 같은 위젯 여러 번 사용'),
                  Text('• 부모-자식 관계: 계층적 구조'),
                  Text('• 데이터 흐름: 위에서 아래로 전달'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 41 | `build()` 메서드 - UI를 반환하는 메서드 |
| 42-43 | `_buildCount++` - build() 호출 시마다 카운트 증가 |
| 45 | `Scaffold` - Material Design 기본 레이아웃 |
| 56-77 | 위젯 트리 구조 설명 Container |
| 74 | `_buildWidgetTree()` - 위젯 트리 시각화 메서드 호출 |
| 81-107 | build() 메서드 특징 설명 Container |
| 111-174 | setState() 동작 원리 설명 Container |
| 143-150 | 카운터와 build() 호출 횟수 표시 |
| 144 | `'$_counter'` - 카운터 값 표시 |
| 147-150 | `'$_buildCount'` - build() 호출 횟수 표시 |
| 164-171 | 카운터 증가 버튼 |
| 165 | `onPressed: _incrementCounter` - 버튼 클릭 시 카운터 증가 |
| 179-204 | 위젯 트리의 특징 설명 Container |

**핵심 포인트:**
- `_buildCount++`: `build()`가 호출될 때마다 증가
- 버튼 클릭 → `setState()` → `build()` 자동 호출 → `_buildCount` 증가
- UI에 `_buildCount` 표시로 실제 호출 횟수 확인 가능

---

### 위젯 트리 시각화 메서드

```211:227:ch02_ui/lib/ch01_위젯기초/ch01-04_widget_tree_build.dart
  Widget _buildWidgetTree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTreeItem('MaterialApp', Colors.blue),
        _buildTreeItem('  └─ Scaffold', Colors.green, indent: 4),
        _buildTreeItem('      ├─ AppBar', Colors.orange, indent: 6),
        _buildTreeItem('      └─ Body', Colors.purple, indent: 6),
        _buildTreeItem('          └─ SingleChildScrollView', Colors.red, indent: 10),
        _buildTreeItem('              └─ Column', Colors.teal, indent: 14),
        _buildTreeItem('                  ├─ Container (위젯 트리)', Colors.purple, indent: 18),
        _buildTreeItem('                  ├─ Container (build 메서드)', Colors.orange, indent: 18),
        _buildTreeItem('                  ├─ Container (setState)', Colors.red, indent: 18),
        _buildTreeItem('                  └─ Container (특징)', Colors.blue, indent: 18),
      ],
    );
  }
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 211 | `_buildWidgetTree()` - 위젯 트리 시각화 메서드 |
| 212 | `Column` - 세로로 위젯 배치 |
| 213 | `crossAxisAlignment` - 가로축 정렬 (시작점) |
| 215-224 | `_buildTreeItem()` - 각 트리 항목 생성 |
| 215 | `'MaterialApp'` - 루트 위젯 |
| 216 | `'  └─ Scaffold'` - 자식 위젯 (들여쓰기 4) |
| 217 | `'      ├─ AppBar'` - AppBar 위젯 (들여쓰기 6) |
| 218 | `'      └─ Body'` - Body 위젯 (들여쓰기 6) |
| 219 | `'          └─ SingleChildScrollView'` - 스크롤 뷰 (들여쓰기 10) |
| 220 | `'              └─ Column'` - Column 위젯 (들여쓰기 14) |
| 221-224 | 여러 Container 위젯들 (들여쓰기 18) |

**핵심 개념:**
- 위젯 트리 구조를 텍스트로 시각화
- 들여쓰기로 부모-자식 관계 표현
- 색상으로 구분

---

### 트리 항목 생성 메서드

```229:241:ch02_ui/lib/ch01_위젯기초/ch01-04_widget_tree_build.dart
  Widget _buildTreeItem(String text, Color color, {int indent = 0}) {
    return Padding(
      padding: EdgeInsets.only(left: indent.toDouble()),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontFamily: 'monospace',
          fontSize: 12,
        ),
      ),
    );
  }
}
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 229 | `_buildTreeItem()` - 트리 항목 생성 메서드 |
| 229 | `String text` - 표시할 텍스트 |
| 229 | `Color color` - 텍스트 색상 |
| 229 | `{int indent = 0}` - 들여쓰기 크기 (기본값 0) |
| 230 | `Padding` - 여백을 주는 위젯 |
| 231 | `EdgeInsets.only(left: ...)` - 왼쪽만 여백 설정 |
| 231 | `indent.toDouble()` - int를 double로 변환 |
| 232 | `Text` - 텍스트 표시 위젯 |
| 235 | `color` - 텍스트 색상 적용 |
| 236 | `fontFamily: 'monospace'` - 고정폭 폰트 (트리 구조 표시에 적합) |
| 237 | `fontSize: 12` - 작은 폰트 크기 |

**핵심 개념:**
- `indent` 매개변수로 들여쓰기 조절
- `monospace` 폰트로 트리 구조 명확히 표시
- 재사용 가능한 헬퍼 메서드

---

## 💡 핵심 개념 정리

### 1. 위젯 트리 구조

```
MaterialApp (루트)
└── Scaffold
    ├── AppBar
    └── Body
        └── SingleChildScrollView
            └── Column
                ├── Container 1
                ├── Container 2
                └── Container 3
```

**특징:**
- 단일 루트: `MaterialApp`이 최상위
- 부모-자식 관계: 계층적 구조
- 중첩 가능: 위젯 안에 위젯

### 2. build() 메서드 호출 시점

```
1. 위젯 생성 시 (최초 1회)
   ↓
2. setState() 호출 시 (매번)
   ↓
3. 부모 위젯이 rebuild될 때
   ↓
4. 의존성 변경 시
```

### 3. setState() → build() 흐름

```
사용자 액션 (버튼 클릭)
    ↓
_incrementCounter() 호출
    ↓
setState(() { _counter++; })
    ↓
Flutter 프레임워크가 상태 변경 감지
    ↓
build() 메서드 자동 호출
    ↓
_buildCount++ (호출 횟수 증가)
    ↓
UI 다시 그리기
    ↓
화면에 업데이트된 값 표시
```

---

## 🎯 실전 팁

### 1. build() 메서드 최적화

```dart
// ✅ 좋은 예: 빠르고 가벼운 작업만
@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Text('$_counter'),
      // 간단한 위젯 구성
    ],
  );
}

// ❌ 나쁜 예: 무거운 작업 수행
@override
Widget build(BuildContext context) {
  // 파일 읽기, 네트워크 요청 등 금지!
  final data = readFile();  // ❌
  return Column(...);
}
```

### 2. build() 호출 최소화

```dart
// ✅ 좋은 예: 필요한 경우에만 setState()
void _updateCounter() {
  if (_counter < 10) {  // 조건 확인
    setState(() {
      _counter++;
    });
  }
}

// ❌ 나쁜 예: 불필요한 setState()
void _updateCounter() {
  setState(() {
    _counter++;  // 항상 호출 (비효율적)
  });
}
```

### 3. 위젯 분리로 rebuild 최적화

```dart
// ✅ 좋은 예: 작은 위젯으로 분리
class CounterDisplay extends StatelessWidget {
  final int counter;
  const CounterDisplay({required this.counter});
  
  @override
  Widget build(BuildContext context) {
    return Text('$counter');
  }
}

// 사용
CounterDisplay(counter: _counter)
```

---

## ⚠️ 주의사항

### 1. build() 내부에서 상태 변경 금지

```dart
// ❌ 잘못된 예: 무한 루프 발생 가능
@override
Widget build(BuildContext context) {
  setState(() {  // ❌ build() 내부에서 setState() 호출
    _counter++;
  });
  return Scaffold(...);
}
```

### 2. build() 내부에서 무거운 작업 금지

```dart
// ❌ 잘못된 예
@override
Widget build(BuildContext context) {
  final data = fetchDataFromNetwork();  // ❌ 네트워크 요청
  return Scaffold(...);
}

// ✅ 올바른 예: initState()나 별도 메서드에서
@override
void initState() {
  super.initState();
  _loadData();  // ✅ 적절한 위치
}
```

### 3. build()는 순수 함수처럼

```dart
// ✅ 좋은 예: 같은 입력 → 같은 출력
@override
Widget build(BuildContext context) {
  return Text('$_counter');  // _counter 값에 따라 결정
}

// ❌ 나쁜 예: 매번 다른 결과
@override
Widget build(BuildContext context) {
  final random = Random().nextInt(100);  // ❌ 매번 다른 값
  return Text('$random');
}
```

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] 위젯 트리 구조를 이해했습니다
- [ ] build() 메서드의 호출 시점을 이해했습니다
- [ ] setState()와 build()의 관계를 이해했습니다
- [ ] build() 메서드가 자동 호출됨을 확인했습니다
- [ ] 위젯 계층 구조를 시각화할 수 있습니다
- [ ] build() 메서드 최적화 방법을 이해했습니다

---

## 🚀 실행 방법

```bash
cd ch02_ui
flutter run lib/ch01_위젯기초/ch01-04_widget_tree_build.dart
```

## 📊 실행 결과 확인

1. 앱 실행 후 "카운터 증가" 버튼 클릭
2. "build() 호출 횟수"가 증가하는지 확인
3. `setState()` 호출 → `build()` 자동 실행 확인

---

## 🔄 다음 단계

이 예제를 완료했다면 다음으로 진행하세요:
- **ch02**: 레이아웃 위젯 (Container, Row, Column 등)

