import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '03-06: 실전 예제 - 카드 UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const PracticalExamplePage(),
    );
  }
}

class PracticalExamplePage extends StatefulWidget {
  const PracticalExamplePage({super.key});

  @override
  State<PracticalExamplePage> createState() => _PracticalExamplePageState();
}

class _PracticalExamplePageState extends State<PracticalExamplePage> {
  bool _isLiked = false;
  int _likeCount = 0;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _likeCount++;
      } else {
        _likeCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('03-06: 실전 예제 - 카드 UI'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
                    '실전 예제: 카드 UI',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• Text, Icon, Button 등을 조합'),
                  Text('• 실제 앱에서 사용하는 카드 레이아웃'),
                  Text('• 상태 관리와 UI 업데이트'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 예제: 카드 UI
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 헤더 영역
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(Icons.person, color: Colors.blue),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '사용자 이름',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '2시간 전',
                                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_horiz),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // 내용 영역
                    const Text(
                      '게시물 내용입니다. 여러 줄로 표시될 수 있습니다. 실제 소셜 미디어 앱에서 사용하는 카드 레이아웃 패턴입니다.',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    // 이미지 영역 (플레이스홀더)
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.image, size: 60, color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    // 액션 영역
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border),
                          color: _isLiked ? Colors.red : Colors.grey,
                          onPressed: _toggleLike,
                        ),
                        Text('$_likeCount'),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.comment_outlined),
                          onPressed: () {},
                        ),
                        const Text('댓글'),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.share_outlined),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 사용된 위젯 설명
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '사용된 위젯:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('• Card: 카드 스타일'),
                  Text('• Text: 텍스트 표시'),
                  Text('• Icon: 아이콘 표시'),
                  Text('• IconButton: 아이콘 버튼'),
                  Text('• Row, Column: 레이아웃'),
                  Text('• StatefulWidget: 상태 관리'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

