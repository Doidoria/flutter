import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '02-04: 타이머 예제',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TimerExamplePage(),
    );
  }
}

// 타이머 예제
class TimerExamplePage extends StatefulWidget {
  const TimerExamplePage({super.key});

  @override
  State<TimerExamplePage> createState() => _TimerExamplePageState();
}

class _TimerExamplePageState extends State<TimerExamplePage> {
  StreamController<int>? _controller;
  Stream<int>? _stream;
  int _seconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<int>();
    _stream = _controller!.stream;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller?.close();
    super.dispose();
  }

  void _startTimer() {
    _seconds = 0;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds < 10) {
        _seconds++;
        _controller?.add(_seconds);
      } else {
        timer.cancel();
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void _resetTimer() {
    _timer?.cancel();
    _seconds = 0;
    _controller?.add(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('02-04: 타이머 예제'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.orange.shade200),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StreamBuilder<int>(
                stream: _stream,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      Text(
                        snapshot.hasData ? '${snapshot.data}' : '0',
                        style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '초',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _startTimer,
                    child: const Text('시작'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _stopTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('중지'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _resetTimer,
                    child: const Text('리셋'),
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

