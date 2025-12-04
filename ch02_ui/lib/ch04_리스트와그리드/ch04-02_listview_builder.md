# ch04-02: ListView.builder - 코드 설명

## 📚 학습 목표
- ListView.builder의 사용법
- 동적 리스트 생성
- itemBuilder 함수 이해
- 성능 최적화

---

## 🔑 중요 코드 설명

### 1. ListView.builder 기본 구조

```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(items[index]),
    );
  },
)
```

**핵심 포인트:**
- `itemCount`: 항목 개수
- `itemBuilder`: 각 항목을 생성하는 함수
- 필요한 항목만 생성 (성능 최적화)

---

## 📝 각 라인별 상세 설명

### ListView.builder 예제

```25:45:ch02_ui/lib/ch04_리스트와그리드/ch04-02_listview_builder.dart
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.primaries[index % Colors.primaries.length],
              child: Text(
                '${index + 1}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(items[index]),
            subtitle: Text('인덱스: $index'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${items[index]} 클릭')),
              );
            },
          );
        },
      ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 25 | `ListView.builder` - 동적 리스트 생성 |
| 27 | `itemCount` - 항목 개수 |
| 28 | `itemBuilder` - 항목 생성 함수 |
| 28 | `(context, index)` - context와 인덱스 |
| 31 | `Colors.primaries[index % ...]` - 색상 순환 |

---

## 💡 핵심 개념 정리

### ListView.builder의 장점

1. **성능 최적화**: 보이는 항목만 생성
2. **동적 데이터**: 런타임에 데이터 변경 가능
3. **메모리 효율**: 큰 리스트에 적합

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] ListView.builder를 사용할 수 있습니다
- [ ] itemBuilder 함수를 이해했습니다
- [ ] 동적 리스트를 만들 수 있습니다

---

## 🚀 실행 방법

```bash
cd ch02_ui
flutter run lib/ch04_리스트와그리드/ch04-02_listview_builder.dart
```

