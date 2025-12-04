import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '03-02: Icon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const IconPage(),
    );
  }
}

class IconPage extends StatefulWidget {
  const IconPage({super.key});

  @override
  State<IconPage> createState() => _IconPageState();
}

class _IconPageState extends State<IconPage> {
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('03-02: Icon'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon 설명
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
                    'Icon이란?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 아이콘을 표시하는 위젯'),
                  Text('• Material Icons 사용'),
                  Text('• 크기, 색상 등 스타일 설정 가능'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 예제 1: 기본 Icon
            const Text(
              '1. 기본 Icon',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                Icon(Icons.home),
                Icon(Icons.favorite),
                Icon(Icons.star),
                Icon(Icons.settings),
                Icon(Icons.search),
                Icon(Icons.person),
              ],
            ),

            const SizedBox(height: 24),

            // 예제 2: 크기가 다른 Icon
            const Text(
              '2. 크기가 다른 Icon',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.star, size: 20),
                SizedBox(width: 16),
                Icon(Icons.star, size: 40),
                SizedBox(width: 16),
                Icon(Icons.star, size: 60),
                SizedBox(width: 16),
                Icon(Icons.star, size: 80),
              ],
            ),

            const SizedBox(height: 24),

            // 예제 3: 색상이 있는 Icon
            const Text(
              '3. 색상이 있는 Icon',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                Icon(Icons.home, size: 40, color: Colors.blue),
                Icon(Icons.favorite, size: 40, color: Colors.red),
                Icon(Icons.star, size: 40, color: Colors.amber),
                Icon(Icons.settings, size: 40, color: Colors.grey),
                Icon(Icons.thumb_up, size: 40, color: Colors.green),
                Icon(Icons.thumb_down, size: 40, color: Colors.orange),
              ],
            ),

            const SizedBox(height: 24),

            // 예제 4: IconButton
            const Text(
              '4. IconButton',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.favorite),
                  color: Colors.red,
                  iconSize: 40,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blue.shade100,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border),
                  color: _isLiked ? Colors.red : Colors.grey,
                  iconSize: 40,
                  onPressed: _toggleLike,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '좋아요 상태: ${_isLiked ? "좋아요" : "좋아요 안 함"}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 24),

            // 예제 5: 다양한 아이콘 카테고리
            const Text(
              '5. 다양한 아이콘 카테고리',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('통신:', style: TextStyle(fontWeight: FontWeight.bold)),
                const Wrap(
                  spacing: 8,
                  children: [
                    Icon(Icons.phone, color: Colors.blue),
                    Icon(Icons.email, color: Colors.green),
                    Icon(Icons.message, color: Colors.orange),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('소셜:', style: TextStyle(fontWeight: FontWeight.bold)),
                const Wrap(
                  spacing: 8,
                  children: [
                    Icon(Icons.share, color: Colors.purple),
                    Icon(Icons.thumb_up, color: Colors.blue),
                    Icon(Icons.comment, color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('내비게이션:', style: TextStyle(fontWeight: FontWeight.bold)),
                const Wrap(
                  spacing: 8,
                  children: [
                    Icon(Icons.home, color: Colors.blue),
                    Icon(Icons.search, color: Colors.grey),
                    Icon(Icons.person, color: Colors.green),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

