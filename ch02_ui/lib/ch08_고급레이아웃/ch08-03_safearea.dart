import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '08-03: SafeArea',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SafeAreaPage(),
    );
  }
}

class SafeAreaPage extends StatelessWidget {
  const SafeAreaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('08-03: SafeArea'),
      ),
      body: Column(
        children: [
          // SafeArea 없이
          Container(
            color: Colors.red.shade100,
            padding: const EdgeInsets.all(16),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SafeArea 없이',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('시스템 UI 영역에 가려질 수 있음'),
              ],
            ),
          ),
          // SafeArea 사용
          SafeArea(
            child: Container(
              color: Colors.blue.shade100,
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SafeArea 사용',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('시스템 UI 영역을 피해서 배치'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

