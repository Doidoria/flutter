import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '04-01: ListView 기본',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ListViewBasicPage(),
    );
  }
}

class ListViewBasicPage extends StatelessWidget {
  const ListViewBasicPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 정적 리스트 데이터
    final List<String> items = List.generate(20, (index) => '항목 ${index + 1}');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('04-01: ListView 기본'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
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
                  'ListView란?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text('• 세로로 스크롤 가능한 리스트'),
                Text('• children으로 위젯 리스트 제공'),
                Text('• 정적 리스트에 적합'),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // 예제 1: 기본 ListView
          const Text(
            '1. 기본 ListView',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: items.take(5).map((item) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    item.split(' ')[1],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(item),
                subtitle: Text('부제목: $item'),
                trailing: const Icon(Icons.chevron_right),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // 예제 2: 다양한 ListTile 스타일
          const Text(
            '2. 다양한 ListTile 스타일',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          const ListTile(
            leading: Icon(Icons.home, color: Colors.blue),
            title: Text('홈'),
            subtitle: Text('홈 화면으로 이동'),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            leading: Icon(Icons.favorite, color: Colors.red),
            title: Text('좋아요'),
            subtitle: Text('좋아요 목록'),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            leading: Icon(Icons.settings, color: Colors.grey),
            title: Text('설정'),
            subtitle: Text('앱 설정'),
            trailing: Icon(Icons.chevron_right),
          ),

          const SizedBox(height: 24),

          // 예제 3: ListTile with onTap
          const Text(
            '3. ListTile with onTap',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: const Text('프로필'),
            subtitle: const Text('사용자 프로필 보기'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('프로필 클릭')),
              );
            },
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.orange,
              child: Icon(Icons.notifications, color: Colors.white),
            ),
            title: const Text('알림'),
            subtitle: const Text('알림 설정'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('알림 클릭')),
              );
            },
          ),

          const SizedBox(height: 24),

          // 예제 4: ListTile with Switch
          const Text(
            '4. ListTile with Switch',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          const ListTile(
            leading: Icon(Icons.wifi, color: Colors.blue),
            title: Text('Wi-Fi'),
            subtitle: Text('무선 네트워크 설정'),
            trailing: Switch(value: true, onChanged: null),
          ),
          const ListTile(
            leading: Icon(Icons.bluetooth, color: Colors.blue),
            title: Text('Bluetooth'),
            subtitle: Text('블루투스 설정'),
            trailing: Switch(value: false, onChanged: null),
          ),
        ],
      ),
    );
  }
}

