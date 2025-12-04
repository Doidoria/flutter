import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '05-03: 여러 데이터 가져오기',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HttpMultiplePage(),
    );
  }
}

class HttpMultiplePage extends StatefulWidget {
  const HttpMultiplePage({super.key});

  @override
  State<HttpMultiplePage> createState() => _HttpMultiplePageState();
}

class _HttpMultiplePageState extends State<HttpMultiplePage> {
  String _responseData = '';
  bool _isLoading = false;
  String _error = '';

  // 여러 데이터 가져오기 예제
  Future<void> _fetchMultipleData() async {
    setState(() {
      _isLoading = true;
      _error = '';
      _responseData = '';
    });

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=5'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _responseData = '총 ${data.length}개의 항목\n\n';
          for (var item in data) {
            _responseData += '제목: ${item['title']}\n';
            _responseData += 'ID: ${item['id']}\n\n';
          }
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = '에러: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = '에러: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('05-03: 여러 데이터 가져오기'),
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
                    '여러 데이터 가져오기',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• 리스트 형태의 데이터 가져오기'),
                  Text('• JSON 배열 파싱'),
                  Text('• URL 쿼리 파라미터 사용'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 요청 버튼
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _fetchMultipleData,
              icon: const Icon(Icons.list),
              label: const Text('여러 데이터 가져오기'),
            ),

            const SizedBox(height: 16),

            // 응답 영역
            _buildResponseArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildResponseArea() {
    if (_isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_error.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.red.shade200),
        ),
        child: Row(
          children: [
            const Icon(Icons.error, color: Colors.red),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                _error,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      );
    }

    if (_responseData.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.green.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  '응답 데이터:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SelectableText(
              _responseData,
              style: const TextStyle(fontSize: 12, fontFamily: 'monospace'),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Center(
        child: Text('버튼을 클릭하여 요청을 보내세요'),
      ),
    );
  }
}

