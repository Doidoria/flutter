import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '05-04: 결과 반환',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ResultReturningPage(),
    );
  }
}

class ResultReturningPage extends StatefulWidget {
  const ResultReturningPage({super.key});

  @override
  State<ResultReturningPage> createState() => _ResultReturningPageState();
}

class _ResultReturningPageState extends State<ResultReturningPage> {
  String? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('05-04: 결과 반환'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '결과 반환 예제',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResultPage(),
                  ),
                );
                if (context.mounted) {
                  setState(() {
                    _result = result as String?;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('받은 결과: $_result')),
                  );
                }
              },
              child: const Text('결과를 받아오기'),
            ),
            if (_result != null) ...[
              const SizedBox(height: 40),
              Text(
                '마지막 결과: $_result',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결과 페이지'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '결과를 선택하세요',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '성공');
              },
              child: const Text('성공 반환'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '취소');
              },
              child: const Text('취소 반환'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '에러');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('에러 반환'),
            ),
          ],
        ),
      ),
    );
  }
}

