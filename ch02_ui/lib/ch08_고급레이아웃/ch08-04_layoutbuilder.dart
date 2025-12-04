import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '08-04: LayoutBuilder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LayoutBuilderPage(),
    );
  }
}

class LayoutBuilderPage extends StatelessWidget {
  const LayoutBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('08-04: LayoutBuilder'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 설명
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LayoutBuilder란?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('현재 너비: ${constraints.maxWidth.toInt()}px'),
                      Text('레이아웃: ${isWide ? "가로" : "세로"}'),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // 반응형 레이아웃
                const Text(
                  '반응형 레이아웃',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 16),
                isWide
                    ? Row(
                        children: [
                          Expanded(
                            child: _buildExampleCard('카드 1', Colors.blue),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildExampleCard('카드 2', Colors.green),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildExampleCard('카드 3', Colors.orange),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          _buildExampleCard('카드 1', Colors.blue),
                          const SizedBox(height: 16),
                          _buildExampleCard('카드 2', Colors.green),
                          const SizedBox(height: 16),
                          _buildExampleCard('카드 3', Colors.orange),
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildExampleCard(String title, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
      ),
      child: Column(
        children: [
          Icon(Icons.star, color: color, size: 40),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

