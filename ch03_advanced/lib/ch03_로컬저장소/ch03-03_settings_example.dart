import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '03-03: 설정 저장 예제',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SettingsExamplePage(),
    );
  }
}

// 설정 저장 예제
class SettingsExamplePage extends StatefulWidget {
  const SettingsExamplePage({super.key});

  @override
  State<SettingsExamplePage> createState() => _SettingsExamplePageState();
}

class _SettingsExamplePageState extends State<SettingsExamplePage> {
  bool _notificationsEnabled = false;
  final TextEditingController _usernameController = TextEditingController();
  int _themeIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  // 설정 불러오기
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationsEnabled = prefs.getBool('notifications') ?? false;
      _usernameController.text = prefs.getString('username') ?? '';
      _themeIndex = prefs.getInt('theme') ?? 0;
    });
  }

  // 설정 저장
  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications', _notificationsEnabled);
    await prefs.setString('username', _usernameController.text);
    await prefs.setInt('theme', _themeIndex);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('설정이 저장되었습니다')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('03-03: 설정 저장 예제'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.purple.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '앱 설정',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('알림 받기'),
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: '사용자 이름',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(
                  labelText: '테마',
                  border: OutlineInputBorder(),
                ),
                value: _themeIndex,
                items: const [
                  DropdownMenuItem(value: 0, child: Text('라이트')),
                  DropdownMenuItem(value: 1, child: Text('다크')),
                ],
                onChanged: (value) {
                  setState(() {
                    _themeIndex = value ?? 0;
                  });
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveSettings,
                  child: const Text('설정 저장'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

