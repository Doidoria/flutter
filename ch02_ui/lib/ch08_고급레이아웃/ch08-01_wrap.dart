import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '08-01: Wrap',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WrapPage(),
    );
  }
}

class WrapPage extends StatelessWidget {
  const WrapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('08-01: Wrap'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 설명
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
                    'Wrap이란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 자동 줄바꿈 레이아웃'),
                  Text('• 공간이 부족하면 다음 줄로'),
                  Text('• 태그, 칩 등에 사용'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 예제 1: 기본 Wrap
            const Text(
              '1. 기본 Wrap',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(10, (index) {
                return Chip(
                  label: Text('태그 ${index + 1}'),
                  avatar: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                );
              }),
            ),

            const SizedBox(height: 24),

            // 예제 2: 다양한 크기의 위젯
            const Text(
              '2. 다양한 크기의 위젯',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.red,
                  child: const Text('짧은', style: TextStyle(color: Colors.white)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.green,
                  child: const Text('중간 길이', style: TextStyle(color: Colors.white)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.blue,
                  child: const Text('매우 긴 텍스트', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

