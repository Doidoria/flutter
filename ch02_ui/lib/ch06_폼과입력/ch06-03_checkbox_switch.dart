import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '06-03: Checkbox와 Switch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CheckboxSwitchPage(),
    );
  }
}

class CheckboxSwitchPage extends StatefulWidget {
  const CheckboxSwitchPage({super.key});

  @override
  State<CheckboxSwitchPage> createState() => _CheckboxSwitchPageState();
}

class _CheckboxSwitchPageState extends State<CheckboxSwitchPage> {
  bool _isChecked = false;
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('06-03: Checkbox와 Switch'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkbox 설명
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
                    'Checkbox와 Switch',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• Checkbox: 체크박스 (선택/해제)'),
                  Text('• Switch: 스위치 (켜기/끄기)'),
                  Text('• 상태 관리 필요'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 예제 1: 기본 Checkbox
            const Text(
              '1. 기본 Checkbox',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text('약관에 동의합니다'),
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),

            const SizedBox(height: 24),

            // 예제 2: 여러 Checkbox
            const Text(
              '2. 여러 Checkbox',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text('옵션 1'),
              value: false,
              onChanged: (value) {},
            ),
            CheckboxListTile(
              title: const Text('옵션 2'),
              value: false,
              onChanged: (value) {},
            ),

            const SizedBox(height: 24),

            // 예제 3: 기본 Switch
            const Text(
              '3. 기본 Switch',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('알림 받기'),
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),

            const SizedBox(height: 24),

            // 예제 4: 여러 Switch
            const Text(
              '4. 여러 Switch',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Wi-Fi'),
              value: true,
              onChanged: (value) {},
            ),
            SwitchListTile(
              title: const Text('Bluetooth'),
              value: false,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}

