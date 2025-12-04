import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '02-02: FutureBuilder 상태 처리',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const FutureBuilderStatesPage(),
    );
  }
}

class FutureBuilderStatesPage extends StatelessWidget {
  const FutureBuilderStatesPage({super.key});

  // 시뮬레이션: 계산 수행
  Future<int> _calculateSum() async {
    await Future.delayed(const Duration(seconds: 1));
    return 1 + 2 + 3 + 4 + 5;
  }

  String _getConnectionStateText(ConnectionState state) {
    switch (state) {
      case ConnectionState.none:
        return '없음';
      case ConnectionState.waiting:
        return '대기 중';
      case ConnectionState.active:
        return '활성';
      case ConnectionState.done:
        return '완료';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('02-02: FutureBuilder 상태 처리'),
      ),
      body: Center(
        child: FutureBuilder<int>(
          future: _calculateSum(),
          builder: (context, snapshot) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '상태: ${_getConnectionStateText(snapshot.connectionState)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  if (snapshot.connectionState == ConnectionState.waiting)
                    const LinearProgressIndicator()
                  else if (snapshot.hasData)
                    Text(
                      '결과: ${snapshot.data}',
                      style: const TextStyle(fontSize: 18),
                    )
                  else if (snapshot.hasError)
                    Text(
                      '에러: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

