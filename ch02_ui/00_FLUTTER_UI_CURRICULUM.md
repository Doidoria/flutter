# Flutter UI 개발을 위한 최소 커리큘럼

## 📚 커리큘럼 개요

이 문서는 Flutter 앱의 사용자 화면 UI를 만드는 데 필요한 최소한의 내용을 단계별로 정리합니다.

---

## 1️⃣ 위젯 기초

### 학습 내용
- StatelessWidget vs StatefulWidget
- Widget 트리 구조
- build() 메서드
- setState()를 통한 상태 업데이트

### 핵심 개념
- 모든 것이 위젯
- 위젯은 불변(immutable)
- 상태 변경 시 새 위젯 생성

---

## 2️⃣ 레이아웃 위젯

### 학습 내용
- **Container**: 크기, 여백, 색상 설정
- **Padding**: 여백 추가
- **Row**: 가로 배치
- **Column**: 세로 배치
- **Stack**: 겹쳐서 배치
- **Expanded/Flexible**: 공간 분배
- **SizedBox**: 고정 크기
- **Center**: 중앙 정렬

### 핵심 개념
- 레이아웃은 위젯 조합
- mainAxisAlignment, crossAxisAlignment
- 크기 제약 이해

---

## 3️⃣ 기본 UI 위젯

### 학습 내용
- **Text**: 텍스트 표시
- **Image**: 이미지 표시
- **Icon**: 아이콘 표시
- **Button**: 버튼 (ElevatedButton, TextButton, OutlinedButton)
- **FloatingActionButton**: 플로팅 버튼
- **AppBar**: 상단 앱바
- **Scaffold**: 기본 화면 구조

### 핵심 개념
- Material Design 컴포넌트
- onPressed 콜백
- 스타일링 옵션

---

## 4️⃣ 리스트와 그리드

### 학습 내용
- **ListView**: 스크롤 가능한 리스트
- **ListView.builder**: 동적 리스트
- **GridView**: 그리드 레이아웃
- **Card**: 카드 위젯
- **ListTile**: 리스트 아이템

### 핵심 개념
- 스크롤 처리
- 동적 데이터 표시
- 성능 최적화

---

## 5️⃣ 네비게이션

### 학습 내용
- **Navigator**: 화면 전환
- **Routes**: 라우트 정의
- **MaterialPageRoute**: 페이지 라우트
- **Named Routes**: 이름 있는 라우트
- **BottomNavigationBar**: 하단 네비게이션
- **Drawer**: 사이드 메뉴

### 핵심 개념
- 화면 간 이동
- 데이터 전달
- 뒤로가기 처리

---

## 6️⃣ 폼과 입력

### 학습 내용
- **TextField**: 텍스트 입력
- **TextFormField**: 폼 텍스트 입력
- **Form**: 폼 컨테이너
- **Checkbox**: 체크박스
- **Radio**: 라디오 버튼
- **Switch**: 스위치
- **Slider**: 슬라이더
- **DropdownButton**: 드롭다운

### 핵심 개념
- 입력 검증
- 상태 관리
- 사용자 상호작용

---

## 7️⃣ 테마와 스타일링

### 학습 내용
- **ThemeData**: 앱 테마
- **ColorScheme**: 색상 스킴
- **TextStyle**: 텍스트 스타일
- **BoxDecoration**: 컨테이너 장식
- **BorderRadius**: 모서리 둥글게
- **Gradient**: 그라데이션
- **Shadow**: 그림자

### 핵심 개념
- 일관된 디자인
- Material Design 3
- 다크 모드 지원

---

## 8️⃣ 고급 레이아웃

### 학습 내용
- **Wrap**: 자동 줄바꿈
- **Flexible/Expanded**: 유연한 크기
- **AspectRatio**: 비율 유지
- **ConstrainedBox**: 크기 제약
- **SingleChildScrollView**: 스크롤 뷰
- **SafeArea**: 안전 영역

### 핵심 개념
- 반응형 레이아웃
- 다양한 화면 크기 대응
- 오버플로우 방지

---

## 📝 학습 순서 추천

1. **1-2주차**: 위젯 기초 + 레이아웃 위젯
2. **3주차**: 기본 UI 위젯
3. **4주차**: 리스트와 그리드
4. **5주차**: 네비게이션
5. **6주차**: 폼과 입력
6. **7주차**: 테마와 스타일링
7. **8주차**: 고급 레이아웃 + 실전 프로젝트

---

## ✅ 최소 필수 체크리스트

Flutter UI 개발을 시작하기 전에 다음을 숙지하세요:

- [ ] StatelessWidget과 StatefulWidget의 차이 이해
- [ ] Row, Column으로 레이아웃 구성
- [ ] Container, Padding으로 스타일링
- [ ] Text, Image, Icon 사용
- [ ] Button 클릭 이벤트 처리
- [ ] Scaffold와 AppBar 사용
- [ ] ListView로 리스트 표시
- [ ] Navigator로 화면 전환
- [ ] TextField로 사용자 입력 받기
- [ ] ThemeData로 테마 설정

---

## 🎯 실전 프로젝트 아이디어

각 단계를 완료한 후 다음 프로젝트를 시도해보세요:

1. **할 일 목록 앱**: 리스트, 입력, 상태 관리
2. **프로필 화면**: 레이아웃, 이미지, 스타일링
3. **쇼핑 목록 앱**: 네비게이션, 리스트, 폼
4. **설정 화면**: Switch, Dropdown, 테마

---

## 📚 참고 자료

- [Flutter 위젯 카탈로그](https://docs.flutter.dev/ui/widgets)
- [Material Design 3](https://m3.material.io/)
- [Flutter 레이아웃 튜토리얼](https://docs.flutter.dev/ui/layout)
- [Flutter 쿡북](https://docs.flutter.dev/cookbook)

---

## 💡 학습 팁

1. **Hot Reload 활용**: 코드 수정 후 즉시 확인
2. **위젯 트리 이해**: 위젯 계층 구조 파악
3. **실제 앱 참고**: 유명 앱의 UI 분석
4. **반복 연습**: 같은 레이아웃을 여러 방법으로 구현
5. **에러 메시지 읽기**: Flutter 에러 메시지는 친절함

