import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '03-02: File I/O',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const FileIOPage(),
    );
  }
}

class FileIOPage extends StatefulWidget {
  const FileIOPage({super.key});

  @override
  State<FileIOPage> createState() => _FileIOPageState();
}

class _FileIOPageState extends State<FileIOPage> {
  String _fileContent = '';

  @override
  void initState() {
    super.initState();
    _loadFile();
  }

  // 로컬 파일 경로 가져오기
  Future<String> _getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // 파일 객체 가져오기
  Future<File> _getLocalFile() async {
    final path = await _getLocalPath();
    return File('$path/my_file.txt');
  }

  // 파일 읽기
  Future<void> _loadFile() async {
    try {
      final file = await _getLocalFile();
      if (await file.exists()) {
        final content = await file.readAsString();
        setState(() {
          _fileContent = content;
        });
      } else {
        setState(() {
          _fileContent = '파일이 없습니다';
        });
      }
    } catch (e) {
      setState(() {
        _fileContent = '에러: $e';
      });
    }
  }

  // 파일 저장
  Future<void> _saveFile(String content) async {
    try {
      final file = await _getLocalFile();
      await file.writeAsString(content);
      await _loadFile();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('파일에 저장되었습니다')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('에러: $e')),
        );
      }
    }
  }

  // 파일 삭제
  Future<void> _deleteFile() async {
    try {
      final file = await _getLocalFile();
      if (await file.exists()) {
        await file.delete();
        await _loadFile();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('파일이 삭제되었습니다')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('에러: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('03-02: File I/O'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'File I/O (파일 읽기/쓰기)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '파일 내용:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  _fileContent,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final controller = TextEditingController();
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('파일 저장'),
                            content: TextField(
                              controller: controller,
                              decoration: const InputDecoration(
                                hintText: '내용을 입력하세요',
                              ),
                              maxLines: 5,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('취소'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (controller.text.isNotEmpty) {
                                    _saveFile(controller.text);
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text('저장'),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('파일 저장'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _deleteFile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('파일 삭제'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

