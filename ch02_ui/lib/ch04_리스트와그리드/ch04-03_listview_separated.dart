import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '04-03: ListView.separated',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ListViewSeparatedPage(),
    );
  }
}

class ListViewSeparatedPage extends StatelessWidget {
  const ListViewSeparatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 리스트 데이터
    final List<Map<String, dynamic>> items = List.generate(
      20,
      (index) => {
        'title': '항목 ${index + 1}',
        'subtitle': '구분선이 있는 리스트',
        'icon': Icons.list,
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('04-03: ListView.separated'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          thickness: 1,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: Icon(
              item['icon'],
              color: Colors.primaries[index % Colors.primaries.length],
            ),
            title: Text(item['title']),
            subtitle: Text(item['subtitle']),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item['title']} 클릭')),
              );
            },
          );
        },
      ),
    );
  }
}

