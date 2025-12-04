import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '02-04: Expanded와 Flexible',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ExpandedFlexiblePage(),
    );
  }
}

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('02-04: Expanded와 Flexible'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded 설명
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.teal.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expanded란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• Row/Column 내에서 남은 공간을 차지'),
                  Text('• flex 속성으로 비율 조절 가능'),
                  Text('• 항상 사용 가능한 모든 공간을 차지'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Expanded 예제 1: 기본
            const Text(
              '1. 기본 Expanded',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.red,
                    child: const Center(child: Text('Expanded', style: TextStyle(color: Colors.white))),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.green,
                    child: const Center(child: Text('Expanded', style: TextStyle(color: Colors.white))),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('Expanded', style: TextStyle(color: Colors.white))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('각 Expanded가 동일한 비율로 공간 차지', style: TextStyle(fontSize: 12, color: Colors.grey)),

            const SizedBox(height: 24),

            // Expanded 예제 2: flex 속성
            const Text(
              '2. flex 속성으로 비율 조절',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    color: Colors.red,
                    child: const Center(child: Text('flex: 1', style: TextStyle(color: Colors.white))),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    color: Colors.green,
                    child: const Center(child: Text('flex: 2', style: TextStyle(color: Colors.white))),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('flex: 1', style: TextStyle(color: Colors.white))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('비율: 1:2:1 (총 4분할 중 각각 1, 2, 1)', style: TextStyle(fontSize: 12, color: Colors.grey)),

            const SizedBox(height: 24),

            // Expanded 예제 3: Column에서 사용
            const Text(
              '3. Column에서 Expanded 사용',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      color: Colors.red,
                      child: const Center(child: Text('flex: 1', style: TextStyle(color: Colors.white))),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      color: Colors.green,
                      child: const Center(child: Text('flex: 2', style: TextStyle(color: Colors.white))),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: const Center(child: Text('flex: 1', style: TextStyle(color: Colors.white))),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            const Divider(height: 40),

            // Flexible 설명
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
                    'Flexible이란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• Expanded보다 유연한 위젯'),
                  Text('• 필요할 때만 공간을 차지'),
                  Text('• 고정 크기 위젯과 함께 사용 가능'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Flexible 예제 1: 기본
            const Text(
              '1. 기본 Flexible',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Flexible(
                  child: Container(
                    height: 50,
                    color: Colors.orange,
                    child: const Center(child: Text('Flexible', style: TextStyle(color: Colors.white))),
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.purple,
                  child: const Center(child: Text('고정', style: TextStyle(color: Colors.white))),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 50,
                    color: Colors.teal,
                    child: const Center(child: Text('Flexible flex: 2', style: TextStyle(color: Colors.white))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Flexible은 필요 공간만 차지, 고정 위젯과 함께 사용 가능', style: TextStyle(fontSize: 12, color: Colors.grey)),

            const SizedBox(height: 24),

            // Expanded vs Flexible 비교
            const Text(
              'Expanded vs Flexible 비교',
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
                  Text('Expanded:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('  • 항상 사용 가능한 모든 공간을 차지'),
                  Text('  • 최소 크기 제약 없음'),
                  SizedBox(height: 8),
                  Text('Flexible:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('  • 필요할 때만 공간을 차지'),
                  Text('  • 고정 크기 위젯과 함께 사용 가능'),
                  Text('  • fit 속성으로 동작 조절 가능'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

