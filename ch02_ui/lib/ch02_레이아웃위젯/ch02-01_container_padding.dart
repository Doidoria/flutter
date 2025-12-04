import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '02-01: Container와 Padding',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ContainerPaddingPage(),
    );
  }
}

class ContainerPaddingPage extends StatelessWidget {
  const ContainerPaddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('02-01: Container와 Padding'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container 설명
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
                    'Container란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 위젯을 감싸는 박스'),
                  Text('• 크기, 색상, 여백, 테두리 등 스타일 설정 가능'),
                  Text('• 가장 많이 사용하는 레이아웃 위젯'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Container 예제 1: 기본
            const Text(
              '1. 기본 Container',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 200,
              height: 100,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  '기본 Container',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Container 예제 2: decoration 사용
            const Text(
              '2. decoration을 사용한 Container',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green.shade700, width: 2),
              ),
              child: const Center(
                child: Text(
                  '둥근 모서리',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Container 예제 3: 그림자 효과
            const Text(
              '3. 그림자 효과가 있는 Container',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  '그림자 효과',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 40),
            const Divider(height: 40),

            // Padding 설명
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
                    'Padding이란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 위젯 주변에 여백을 추가'),
                  Text('• Container보다 간단하게 여백 설정'),
                  Text('• EdgeInsets로 여백 크기 지정'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Padding 예제 1: 기본
            const Text(
              '1. 기본 Padding',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: Colors.orange,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Padding 예제',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Padding 예제 2: 다양한 EdgeInsets
            const Text(
              '2. 다양한 EdgeInsets 사용',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                // EdgeInsets.all
                Container(
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('EdgeInsets.all(16)', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // EdgeInsets.symmetric
                Container(
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Container(
                      color: Colors.green,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('EdgeInsets.symmetric(horizontal: 20, vertical: 10)', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // EdgeInsets.only
                Container(
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10, right: 10, bottom: 20),
                    child: Container(
                      color: Colors.blue,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('EdgeInsets.only(left: 30, top: 10, right: 10, bottom: 20)', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

