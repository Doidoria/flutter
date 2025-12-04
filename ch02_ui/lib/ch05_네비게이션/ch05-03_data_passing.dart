import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '05-03: 데이터 전달',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DataPassingPage(),
    );
  }
}

class DataPassingPage extends StatelessWidget {
  const DataPassingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('05-03: 데이터 전달'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '데이터 전달 예제',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailPage(data: '전달된 데이터'),
                  ),
                );
              },
              child: const Text('데이터와 함께 이동'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailPage(
                      data: '다른 데이터',
                      number: 42,
                    ),
                  ),
                );
              },
              child: const Text('여러 데이터 전달'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String data;
  final int? number;

  const DetailPage({
    super.key,
    required this.data,
    this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상세 페이지'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '받은 데이터: $data',
              style: const TextStyle(fontSize: 18),
            ),
            if (number != null) ...[
              const SizedBox(height: 16),
              Text(
                '받은 숫자: $number',
                style: const TextStyle(fontSize: 18),
              ),
            ],
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('뒤로가기'),
            ),
          ],
        ),
      ),
    );
  }
}

