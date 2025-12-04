# ch05-01: HTTP GET 요청 - 코드 설명

## 📚 학습 목표
- http 패키지 사용
- GET 요청 보내기
- 응답 처리

---

## 🔑 중요 코드 설명

### GET 요청

```dart
import 'package:http/http.dart' as http;

final response = await http.get(
  Uri.parse('https://api.example.com/data'),
);

if (response.statusCode == 200) {
  final data = json.decode(response.body);
}
```

**핵심 포인트:**
- `http.get()`: GET 요청
- `response.statusCode`: 상태 코드
- `response.body`: 응답 본문

---

## ✅ 체크리스트

이 예제를 완료했다면 다음을 확인하세요:

- [ ] http 패키지를 사용할 수 있습니다
- [ ] GET 요청을 보낼 수 있습니다
- [ ] 응답을 처리할 수 있습니다

---

## 🚀 실행 방법

```bash
cd ch03_advanced
flutter run lib/ch05_외부패키지/ch05-01_http_get.dart
```

