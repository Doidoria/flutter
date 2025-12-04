import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '04-05: Card 기본',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CardBasicPage(),
    );
  }
}

class CardBasicPage extends StatelessWidget {
  const CardBasicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('04-05: Card 기본'),
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
                  'Card란?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text('• Material Design의 카드 위젯'),
                Text('• elevation으로 그림자 효과'),
                Text('• 정보를 그룹화하여 표시'),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // 예제 1: 기본 Card
          const Text(
            '1. 기본 Card',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info, color: Colors.blue),
              title: const Text('카드 제목'),
              subtitle: const Text('카드 부제목'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('카드 클릭')),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // 예제 2: elevation이 있는 Card
          const Text(
            '2. elevation이 있는 Card',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 8,
            child: ListTile(
              leading: const Icon(Icons.star, color: Colors.amber),
              title: const Text('중요 카드'),
              subtitle: const Text('elevation: 8'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),

          const SizedBox(height: 24),

          // 예제 3: 색상이 있는 Card
          const Text(
            '3. 색상이 있는 Card',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.blue.shade50,
            child: ListTile(
              leading: const Icon(Icons.favorite, color: Colors.red),
              title: const Text('좋아요 카드'),
              subtitle: const Text('색상이 적용된 카드'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),

          const SizedBox(height: 24),

          // 예제 4: 여러 Card
          const Text(
            '4. 여러 Card',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: const Text('홈'),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.settings, color: Colors.grey),
              title: const Text('설정'),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.help, color: Colors.green),
              title: const Text('도움말'),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

