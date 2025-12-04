# Flutter 고급 개발을 위한 최소 커리큘럼

## 커리큘럼 개요

이 문서는 Flutter 앱의 고급 기능을 구현하는 데 필요한 최소한의 내용을 단계별로 정리합니다.

---

## 1️⃣ 상태 관리 (중급)

### 학습 내용
- Provider 패턴
- Provider 사용법
- ChangeNotifier
- Consumer 위젯
- 상태 관리 패턴 이해

### 핵심 개념
- 상태와 UI 분리
- 상태 공유
- 효율적인 상태 업데이트

---

## 2️⃣ 비동기 처리

### 학습 내용
- async/await 심화
- FutureBuilder: Future 기반 비동기 UI
- StreamBuilder: Stream 기반 비동기 UI
- 로딩 상태 처리
- 에러 처리

### 핵심 개념
- 비동기 데이터 표시
- 로딩 인디케이터
- 에러 핸들링

---

## 3️⃣ 로컬 저장소

### 학습 내용
- SharedPreferences: 간단한 키-값 저장
- File I/O: 파일 읽기/쓰기
- 경로 관리 (path_provider)
- 데이터 영구 저장

### 핵심 개념
- 앱 재시작 후 데이터 유지
- 파일 시스템 접근
- 데이터 저장 패턴

---

## 4️⃣ 이미지 & 미디어

### 학습 내용
- image_picker 패키지
- 갤러리에서 이미지 선택
- 카메라로 사진 촬영
- 이미지 표시 및 처리
- 이미지 업로드 준비

### 핵심 개념
- 플랫폼별 권한 처리
- 이미지 선택 및 표시
- 미디어 파일 처리

---

## 5️⃣ 외부 패키지 사용

### 학습 내용
- pub.dev 패키지 검색
- pubspec.yaml에 패키지 추가
- http 패키지: 네트워크 요청
- 패키지 버전 관리
- 패키지 사용법 이해

### 핵심 개념
- 패키지 의존성 관리
- API 호출
- 외부 라이브러리 활용

---

## 학습 순서 추천

1. **1주차**: 상태 관리 (Provider)
2. **2주차**: 비동기 처리 (FutureBuilder, StreamBuilder)
3. **3주차**: 로컬 저장소 (SharedPreferences, File I/O)
4. **4주차**: 이미지 & 미디어 (image_picker)
5. **5주차**: 외부 패키지 사용 (http 등)

---

## 최소 필수 체크리스트

Flutter 고급 개발을 시작하기 전에 다음을 숙지하세요:

- [ ] Provider로 상태를 관리할 수 있습니다
- [ ] FutureBuilder로 비동기 데이터를 표시할 수 있습니다
- [ ] StreamBuilder로 스트림 데이터를 표시할 수 있습니다
- [ ] SharedPreferences로 데이터를 저장할 수 있습니다
- [ ] File I/O로 파일을 읽고 쓸 수 있습니다
- [ ] image_picker로 이미지를 선택할 수 있습니다
- [ ] http 패키지로 API를 호출할 수 있습니다
- [ ] pubspec.yaml에 패키지를 추가할 수 있습니다

---

## 실전 프로젝트 아이디어

각 단계를 완료한 후 다음 프로젝트를 시도해보세요:

1. **상태 관리 앱**: Provider를 사용한 할 일 목록
2. **비동기 데이터 앱**: API에서 데이터를 가져와 표시
3. **로컬 저장 앱**: 설정을 저장하고 불러오기
4. **이미지 갤러리 앱**: 이미지 선택 및 표시
5. **통합 앱**: 위 모든 기능을 결합한 완전한 앱

---

## 참고 자료

- [Flutter 공식 문서](https://docs.flutter.dev/)
- [pub.dev 패키지 저장소](https://pub.dev/)
- [Provider 패키지](https://pub.dev/packages/provider)
- [http 패키지](https://pub.dev/packages/http)
- [image_picker 패키지](https://pub.dev/packages/image_picker)

---

## 학습 팁

1. **패키지 활용**: pub.dev에서 필요한 패키지 검색
2. **에러 처리**: 항상 try-catch로 에러 처리
3. **비동기 이해**: async/await 패턴 숙지
4. **상태 관리**: 적절한 상태 관리 패턴 선택
5. **실전 연습**: 각 기능을 실제 프로젝트에 적용

