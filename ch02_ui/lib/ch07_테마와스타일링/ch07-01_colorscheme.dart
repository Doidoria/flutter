import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '07-01: ColorScheme',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ColorSchemePage(),
    );
  }
}

class ColorSchemePage extends StatelessWidget {
  const ColorSchemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('07-01: ColorScheme'),
      ),
      body: SingleChildScrollView(
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ColorScheme이란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• Material Design 3의 색상 시스템'),
                  Text('• 일관된 색상 사용'),
                  Text('• Theme.of(context).colorScheme으로 접근'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ColorScheme 색상들
            const Text(
              'ColorScheme 색상',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            _buildColorBox('Primary', theme.colorScheme.primary),
            _buildColorBox('Secondary', theme.colorScheme.secondary),
            _buildColorBox('Error', theme.colorScheme.error),
            _buildColorBox('Surface', theme.colorScheme.surface),
            _buildColorBox('OnPrimary', theme.colorScheme.onPrimary),
            _buildColorBox('OnSecondary', theme.colorScheme.onSecondary),
          ],
        ),
      ),
    );
  }

  Widget _buildColorBox(String label, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            '#${color.value.toRadixString(16).substring(2)}',
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

