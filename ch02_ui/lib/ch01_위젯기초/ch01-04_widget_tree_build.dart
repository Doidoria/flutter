import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '01-04: 위젯 트리와 build() 메서드',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const WidgetTreePage(),
    );
  }
}

class WidgetTreePage extends StatefulWidget {
  const WidgetTreePage({super.key});

  @override
  State<WidgetTreePage> createState() => _WidgetTreePageState();
}

class _WidgetTreePageState extends State<WidgetTreePage> {
  int _counter = 0;
  int _buildCount = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // build() 메서드가 호출될 때마다 카운트 증가
    _buildCount++;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('01-04: 위젯 트리와 build() 메서드'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 위젯 트리 구조 설명
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '위젯 트리 구조',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildWidgetTree(),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // build() 메서드 설명
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
                    'build() 메서드 특징',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 위젯을 반환합니다'),
                  Text('• setState() 호출 시 자동 실행됩니다'),
                  Text('• 빠르게 실행되어야 합니다'),
                  Text('• 순수 함수처럼 동작해야 합니다'),
                  Text('• 무거운 작업은 피해야 합니다'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // setState() 동작 원리
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'setState() 동작 원리',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('1. 상태가 변경됩니다'),
                  const Text('2. build() 메서드가 호출됩니다'),
                  const Text('3. UI가 다시 그려집니다'),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '현재 카운터: $_counter',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'build() 호출 횟수: $_buildCount',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '※ setState()를 호출할 때마다 build()가 실행됩니다',
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _incrementCounter,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('카운터 증가 (build() 호출 확인)'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 위젯 트리의 특징
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
                    '위젯 트리의 특징',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 단일 루트: 하나의 루트 위젯'),
                  Text('• 중첩 가능: 위젯 안에 위젯'),
                  Text('• 재사용 가능: 같은 위젯 여러 번 사용'),
                  Text('• 부모-자식 관계: 계층적 구조'),
                  Text('• 데이터 흐름: 위에서 아래로 전달'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetTree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTreeItem('MaterialApp', Colors.blue),
        _buildTreeItem('  └─ Scaffold', Colors.green, indent: 4),
        _buildTreeItem('      ├─ AppBar', Colors.orange, indent: 6),
        _buildTreeItem('      └─ Body', Colors.purple, indent: 6),
        _buildTreeItem('          └─ SingleChildScrollView', Colors.red, indent: 10),
        _buildTreeItem('              └─ Column', Colors.teal, indent: 14),
        _buildTreeItem('                  ├─ Container (위젯 트리)', Colors.purple, indent: 18),
        _buildTreeItem('                  ├─ Container (build 메서드)', Colors.orange, indent: 18),
        _buildTreeItem('                  ├─ Container (setState)', Colors.red, indent: 18),
        _buildTreeItem('                  └─ Container (특징)', Colors.blue, indent: 18),
      ],
    );
  }

  Widget _buildTreeItem(String text, Color color, {int indent = 0}) {
    return Padding(
      padding: EdgeInsets.only(left: indent.toDouble()),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontFamily: 'monospace',
          fontSize: 12,
        ),
      ),
    );
  }
}

