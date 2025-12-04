# ch06-04: Radio와 Slider - 코드 설명

## 📚 학습 목표
- Radio 사용법
- Slider 사용법
- 단일 선택과 범위 선택

---

## 🔑 중요 코드 설명

### 1. RadioListTile

```dart
RadioListTile<String>(
  title: Text('옵션 1'),
  value: '옵션 1',
  groupValue: _selectedValue,
  onChanged: (value) {
    setState(() {
      _selectedValue = value!;
    });
  },
)
```

**핵심 포인트:**
- `groupValue`: 선택된 값
- 같은 `groupValue`를 공유하는 Radio는 그룹

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] Radio를 사용할 수 있습니다
- [ ] Slider를 사용할 수 있습니다

---

## 🚀 실행 방법

```bash
cd ch02_ui
flutter run lib/ch06_폼과입력/ch06-04_radio_slider.dart
```

