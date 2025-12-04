import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '01-04: 할 일 목록 예제',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TodoExamplePage(),
    );
  }
}

// 할 일 목록 Provider
class TodoProvider extends ChangeNotifier {
  final List<TodoItem> _todos = [];

  List<TodoItem> get todos => _todos;

  void addTodo(String title) {
    _todos.add(TodoItem(title: title, completed: false));
    notifyListeners();
  }

  void toggleTodo(int index) {
    _todos[index].completed = !_todos[index].completed;
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}

class TodoItem {
  final String title;
  bool completed;

  TodoItem({required this.title, required this.completed});
}

class TodoExamplePage extends StatelessWidget {
  const TodoExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('01-04: 할 일 목록 예제'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.purple.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '할 일 목록',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Consumer<TodoProvider>(
                builder: (context, provider, child) {
                  if (provider.todos.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text('할 일이 없습니다'),
                      ),
                    );
                  }
                  return Column(
                    children: List.generate(
                      provider.todos.length,
                      (index) {
                        final todo = provider.todos[index];
                        return ListTile(
                          leading: Checkbox(
                            value: todo.completed,
                            onChanged: (_) => provider.toggleTodo(index),
                          ),
                          title: Text(
                            todo.title,
                            style: TextStyle(
                              decoration: todo.completed
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => provider.removeTodo(index),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Consumer<TodoProvider>(
                builder: (context, provider, child) {
                  return ElevatedButton.icon(
                    onPressed: () {
                      final controller = TextEditingController();
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('할 일 추가'),
                          content: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              hintText: '할 일을 입력하세요',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('취소'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (controller.text.isNotEmpty) {
                                  provider.addTodo(controller.text);
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text('추가'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('할 일 추가'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

