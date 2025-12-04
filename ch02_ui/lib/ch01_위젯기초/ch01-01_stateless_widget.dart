import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '01-01: StatelessWidget 기초',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const StatelessWidgetPage(),
    );
  }
}

class StatelessWidgetPage extends StatelessWidget {
  const StatelessWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('01-01: StatelessWidget 기초'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 설명 섹션
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
                    'StatelessWidget이란?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('• 상태가 없는 위젯'),
                  Text('• 한 번 생성되면 변경되지 않음'),
                  Text('• build() 메서드만 있음'),
                  Text('• 항상 같은 UI를 표시'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 예제 1
            const Text(
              '예제 1: 기본 StatelessWidget',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const StaticWidget(
              title: '정적 위젯 예제',
              description: '이 위젯은 상태가 없습니다. 항상 같은 내용을 표시합니다.',
            ),

            const SizedBox(height: 24),

            // 예제 2
            const Text(
              '예제 2: 여러 StatelessWidget 사용',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const StaticWidget(
              title: '첫 번째 정적 위젯',
              description: '항상 같은 내용을 표시합니다.',
            ),
            const SizedBox(height: 16),
            const StaticWidget(
              title: '두 번째 정적 위젯',
              description: '이 위젯도 항상 같은 내용을 표시합니다.',
            ),
            const SizedBox(height: 16),
            const StaticWidget(
              title: '세 번째 정적 위젯',
              description: 'StatelessWidget은 상태를 가지지 않습니다.',
            ),
          ],
        ),
      ),
    );
  }
}

// StatelessWidget 예제 클래스
class StaticWidget extends StatelessWidget {
  final String title;
  final String description;

  const StaticWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
