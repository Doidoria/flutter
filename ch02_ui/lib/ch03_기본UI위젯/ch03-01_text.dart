import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '03-01: Text',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TextPage(),
    );
  }
}

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('03-01: Text'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text 설명
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
                    'Text란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 텍스트를 표시하는 기본 위젯'),
                  Text('• TextStyle으로 스타일 설정'),
                  Text('• 가장 많이 사용하는 위젯'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 예제 1: 기본 Text
            const Text(
              '1. 기본 Text',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Text('기본 텍스트'),

            const SizedBox(height: 24),

            // 예제 2: 스타일이 있는 Text
            const Text(
              '2. 스타일이 있는 Text',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '큰 텍스트',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '작은 텍스트',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 8),
            const Text(
              '이탤릭체 텍스트',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),

            const SizedBox(height: 24),

            // 예제 3: 색상이 있는 Text
            const Text(
              '3. 색상이 있는 Text',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '파란색 텍스트',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              '빨간색 텍스트',
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              '초록색 텍스트',
              style: TextStyle(color: Colors.green, fontSize: 18),
            ),

            const SizedBox(height: 24),

            // 예제 4: 여러 줄 Text
            const Text(
              '4. 여러 줄 Text',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '여러 줄 텍스트\n두 번째 줄\n세 번째 줄',
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 24),

            // 예제 5: 정렬이 있는 Text
            const Text(
              '5. 정렬이 있는 Text',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(8),
              child: const Text(
                '왼쪽 정렬 (기본값)',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(8),
              child: const Text(
                '중앙 정렬',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(8),
              child: const Text(
                '오른쪽 정렬',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 14),
              ),
            ),

            const SizedBox(height: 24),

            // 예제 6: 복합 스타일 Text
            const Text(
              '6. 복합 스타일 Text',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '굵고 큰 파란색 텍스트',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '밑줄이 있는 텍스트',
              style: TextStyle(
                fontSize: 18,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '취소선이 있는 텍스트',
              style: TextStyle(
                fontSize: 18,
                decoration: TextDecoration.lineThrough,
              ),
            ),

            const SizedBox(height: 24),

            // 예제 7: RichText (TextSpan)
            const Text(
              '7. RichText (TextSpan)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Text.rich(
              TextSpan(
                text: '일반 텍스트 ',
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: '굵은 텍스트 ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text: '빨간색 텍스트',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

