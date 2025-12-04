# ch02-01: FutureBuilder 기본 - 코드 설명

## 📚 학습 목표
- FutureBuilder 기본 사용법
- ConnectionState 이해
- 로딩, 에러, 성공 상태 처리

---

## 🔑 중요 코드 설명

### FutureBuilder 구조

```dart
FutureBuilder<String>(
  future: _fetchData(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    if (snapshot.hasError) {
      return Text('에러: ${snapshot.error}');
    }
    return Text('${snapshot.data}');
  },
)
```

**핵심 포인트:**
- `future`: 비동기 작업
- `snapshot`: 상태 정보
- `ConnectionState`: 연결 상태

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] FutureBuilder를 사용할 수 있습니다
- [ ] ConnectionState를 이해했습니다
- [ ] 로딩, 에러, 성공 상태를 처리할 수 있습니다

---

## 🚀 실행 방법

```bash
cd ch03_advanced
flutter run lib/ch02_비동기처리/ch02-01_futurebuilder_basic.dart
```

