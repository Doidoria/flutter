import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '03-04: Button',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ButtonPage(),
    );
  }
}

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('03-04: Button'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Button 설명
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
                    'Button이란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 사용자 액션을 받는 위젯'),
                  Text('• ElevatedButton: 강조된 버튼'),
                  Text('• TextButton: 텍스트 버튼'),
                  Text('• OutlinedButton: 테두리 버튼'),
                  Text('• IconButton: 아이콘 버튼'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 예제 1: ElevatedButton
            const Text(
              '1. ElevatedButton',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('ElevatedButton'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: null, // 비활성화
                  child: const Text('비활성화된 버튼'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('초록색 버튼'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 예제 2: TextButton
            const Text(
              '2. TextButton',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('TextButton'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: null,
                  child: const Text('비활성화된 버튼'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                  ),
                  child: const Text('파란색 텍스트 버튼'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 예제 3: OutlinedButton
            const Text(
              '3. OutlinedButton',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('OutlinedButton'),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: null,
                  child: const Text('비활성화된 버튼'),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.purple,
                    side: const BorderSide(color: Colors.purple),
                  ),
                  child: const Text('보라색 테두리 버튼'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 예제 4: IconButton
            const Text(
              '4. IconButton',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  color: Colors.red,
                  iconSize: 40,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blue.shade100,
                  ),
                ),
                IconButton(
                  onPressed: null,
                  icon: const Icon(Icons.delete),
                  color: Colors.grey,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 예제 5: 버튼 with 아이콘
            const Text(
              '5. 버튼 with 아이콘',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text('다운로드'),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  label: const Text('공유'),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                  label: const Text('삭제'),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 예제 6: 전체 너비 버튼
            const Text(
              '6. 전체 너비 버튼',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('전체 너비 버튼'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('전체 너비 OutlinedButton'),
              ),
            ),

            const SizedBox(height: 24),

            // 예제 7: 버튼 크기 조절
            const Text(
              '7. 버튼 크기 조절',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text('기본 크기'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  child: const Text('큰 버튼'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

