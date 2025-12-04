# ch04-04: 이미지 정보 표시 - 코드 설명

## 📚 학습 목표
- XFile 속성 이해
- 이미지 정보 표시
- 경로, 크기, MIME 타입

---

## 🔑 중요 코드 설명

### 이미지 정보

```dart
XFile image = ...;

image.path      // 파일 경로
image.name      // 파일 이름
image.length    // 파일 크기 (bytes)
image.mimeType  // MIME 타입
```

**핵심 포인트:**
- `XFile`: 이미지 파일 객체
- 다양한 속성 제공

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] 이미지 정보를 가져올 수 있습니다
- [ ] 이미지 정보를 표시할 수 있습니다

---

## 🚀 실행 방법

```bash
cd ch03_advanced
flutter run lib/ch04_이미지미디어/ch04-04_image_info.dart
```

