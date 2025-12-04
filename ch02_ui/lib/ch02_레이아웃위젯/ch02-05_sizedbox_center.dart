import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '02-05: SizedBox와 Center',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SizedBoxCenterPage(),
    );
  }
}

class SizedBoxCenterPage extends StatelessWidget {
  const SizedBoxCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('02-05: SizedBox와 Center'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox 설명
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
                    'SizedBox란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 고정 크기의 공간을 만드는 위젯'),
                  Text('• 위젯 간 간격 조절에 사용'),
                  Text('• 자식 위젯의 크기 제한에도 사용'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // SizedBox 예제 1: 고정 크기
            const Text(
              '1. 고정 크기 SizedBox',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('고정 크기 버튼'),
              ),
            ),

            const SizedBox(height: 24),

            // SizedBox 예제 2: 전체 너비
            const Text(
              '2. 전체 너비 SizedBox',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('전체 너비 버튼'),
              ),
            ),

            const SizedBox(height: 24),

            // SizedBox 예제 3: 간격 조절
            const Text(
              '3. 간격 조절용 SizedBox',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.red,
                  child: const Center(child: Text('위', style: TextStyle(color: Colors.white))),
                ),
                const SizedBox(height: 20), // 간격
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.green,
                  child: const Center(child: Text('중간', style: TextStyle(color: Colors.white))),
                ),
                const SizedBox(height: 20), // 간격
                Container(
                  width: 100,
                  height: 50,
                  color: Colors.blue,
                  child: const Center(child: Text('아래', style: TextStyle(color: Colors.white))),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // SizedBox 예제 4: 가로 간격
            const Text(
              '4. 가로 간격 조절',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                const SizedBox(width: 30), // 가로 간격
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                ),
                const SizedBox(width: 30), // 가로 간격
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // SizedBox 예제 5: 크기 제한
            const Text(
              '5. 크기 제한용 SizedBox',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              height: 100,
              child: Container(
                color: Colors.purple,
                child: const Center(
                  child: Text(
                    '크기 제한된 Container',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
            const Divider(height: 40),

            // Center 설명
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
                    'Center란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 자식 위젯을 중앙에 배치'),
                  Text('• 가장 간단한 정렬 위젯'),
                  Text('• Container의 alignment보다 간단'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Center 예제 1: 기본
            const Text(
              '1. 기본 Center',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.grey.shade200,
              child: const Center(
                child: Text(
                  '중앙 정렬된 텍스트',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Center 예제 2: 아이콘 중앙 정렬
            const Text(
              '2. 아이콘 중앙 정렬',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.grey.shade200,
              child: const Center(
                child: Icon(
                  Icons.star,
                  size: 60,
                  color: Colors.amber,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Center 예제 3: 버튼 중앙 정렬
            const Text(
              '3. 버튼 중앙 정렬',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.grey.shade200,
              child: const Center(
                child: ElevatedButton(
                  onPressed: null,
                  child: Text('중앙 버튼'),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Center 예제 4: 여러 위젯 중앙 정렬
            const Text(
              '4. 여러 위젯 중앙 정렬',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.shade200,
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite, size: 50, color: Colors.red),
                    SizedBox(height: 16),
                    Text(
                      '중앙 정렬된 컬럼',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

