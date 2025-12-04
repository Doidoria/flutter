import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '05-04: 패키지 정보',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const PackageInfoPage(),
    );
  }
}

class PackageInfoPage extends StatelessWidget {
  const PackageInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('05-04: 패키지 정보'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // pubspec.yaml 설명
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
                    'pubspec.yaml에 패키지 추가',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('dependencies:'),
                  Text('  http: ^1.1.2'),
                  SizedBox(height: 8),
                  Text('그 다음 실행:'),
                  Text('flutter pub get'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 사용 중인 패키지
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '사용 중인 패키지:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• http: HTTP 요청'),
                  Text('• provider: 상태 관리'),
                  Text('• shared_preferences: 로컬 저장'),
                  Text('• path_provider: 경로 관리'),
                  Text('• image_picker: 이미지 선택'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 패키지 찾기
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
                    '패키지 찾기:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('https://pub.dev'),
                  SizedBox(height: 8),
                  Text('• 검색으로 원하는 패키지 찾기'),
                  Text('• 설치 방법 확인'),
                  Text('• 사용 예제 확인'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 패키지 사용 팁
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '패키지 사용 팁:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• pubspec.yaml에 추가 후 flutter pub get 실행'),
                  Text('• import 문으로 패키지 가져오기'),
                  Text('• 패키지 문서 확인 필수'),
                  Text('• 버전 호환성 확인'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

