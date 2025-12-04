# ch04-06: Card 심화 - 코드 설명

## 📚 학습 목표
- 복잡한 Card 레이아웃
- 이미지와 텍스트 조합
- 여러 ListTile을 포함한 Card
- 버튼이 있는 Card

---

## 🔑 중요 코드 설명

### 1. 이미지가 있는 Card

```dart
Card(
  elevation: 4,
  child: Column(
    children: [
      Container(...), // 이미지 영역
      Padding(...),   // 내용 영역
    ],
  ),
)
```

**핵심 포인트:**
- Column으로 이미지와 내용 분리
- BorderRadius로 모서리 처리

---

## 📝 각 라인별 상세 설명

### 예제 1: 이미지가 있는 Card

```67:110:ch02_ui/lib/ch04_리스트와그리드/ch04-06_card_advanced.dart
          Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(4),
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.image, size: 60, color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '카드 제목',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text('카드 내용입니다. 여러 줄로 표시될 수 있습니다.'),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: null,
                            child: const Text('취소'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: null,
                            child: const Text('확인'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
```

**라인별 설명:**

| 라인 | 설명 |
|------|------|
| 68 | `elevation: 4` - 그림자 효과 |
| 69 | `Column` - 세로 배치 |
| 72-81 | 이미지 영역 Container |
| 82 | `Padding` - 내용 영역 여백 |
| 100-107 | 버튼 Row |

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] 복잡한 Card 레이아웃을 만들 수 있습니다
- [ ] 이미지와 텍스트를 조합할 수 있습니다
- [ ] 여러 ListTile을 포함한 Card를 만들 수 있습니다
- [ ] 버튼이 있는 Card를 만들 수 있습니다

---

## 🚀 실행 방법

```bash
cd ch02_ui
flutter run lib/ch04_리스트와그리드/ch04-06_card_advanced.dart
```

