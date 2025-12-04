# ch04-03: 여러 이미지 선택 - 코드 설명

## 📚 학습 목표
- 여러 이미지 선택
- pickMultiImage 사용
- 리스트로 이미지 표시

---

## 🔑 중요 코드 설명

### 여러 이미지 선택

```dart
final List<XFile> images = await _picker.pickMultiImage(
  maxWidth: 800,
  maxHeight: 800,
  imageQuality: 85,
);
```

**핵심 포인트:**
- `pickMultiImage()`: 여러 이미지 선택
- 리스트로 반환

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] 여러 이미지를 선택할 수 있습니다
- [ ] 리스트로 이미지를 표시할 수 있습니다

---

## 🚀 실행 방법

```bash
cd ch03_advanced
flutter run lib/ch04_이미지미디어/ch04-03_image_picker_multiple.dart
```

