import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '03-05: FloatingActionButton',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const FloatingActionButtonPage(),
    );
  }
}

class FloatingActionButtonPage extends StatelessWidget {
  const FloatingActionButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('03-05: FloatingActionButton'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FloatingActionButton 설명
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
                    'FloatingActionButton이란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 화면에 떠있는 원형 버튼'),
                  Text('• 주요 액션에 사용'),
                  Text('• Scaffold의 floatingActionButton 속성에 배치'),
                  Text('• 화면 우측 하단에 기본 위치'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 예제 1: 기본 FloatingActionButton
            const Text(
              '1. 기본 FloatingActionButton',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 100,
              alignment: Alignment.center,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),

            const SizedBox(height: 24),

            // 예제 2: 다양한 아이콘
            const Text(
              '2. 다양한 아이콘',
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
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.edit),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.delete),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.share),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 예제 3: 색상이 다른 FloatingActionButton
            const Text(
              '3. 색상이 다른 FloatingActionButton',
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
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.check, color: Colors.white),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.orange,
                  child: const Icon(Icons.star, color: Colors.white),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 예제 4: 크기가 다른 FloatingActionButton
            const Text(
              '4. 크기가 다른 FloatingActionButton',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 16),
                FloatingActionButton.large(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 예제 5: Extended FloatingActionButton
            const Text(
              '5. Extended FloatingActionButton',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('추가하기'),
            ),

            const SizedBox(height: 24),

            // 예제 6: 비활성화된 FloatingActionButton
            const Text(
              '6. 비활성화된 FloatingActionButton',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
              onPressed: null, // 비활성화
              child: const Icon(Icons.add),
            ),

            const SizedBox(height: 24),

            // 예제 7: Scaffold에서 사용
            const Text(
              '7. Scaffold에서 사용',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Scaffold의 floatingActionButton 속성에 배치:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Scaffold(\n  floatingActionButton: FloatingActionButton(\n    onPressed: () {},\n    child: Icon(Icons.add),\n  ),\n)',
                    style: TextStyle(fontFamily: 'monospace', fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '※ 이 페이지의 우측 하단에 FloatingActionButton이 표시됩니다.',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('FloatingActionButton 클릭!')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

