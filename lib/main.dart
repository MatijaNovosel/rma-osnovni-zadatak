import 'package:flutter/material.dart';
import 'models/todo_item.dart';
import 'widgets/todo_item.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Todo app'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TodoItem> _todoItems = [
    TodoItem(id: 1, text: "Item 1"),
    TodoItem(id: 2, text: "Item 2"),
    TodoItem(id: 3, text: "Item 3"),
  ];

  final TextEditingController _textFieldController = TextEditingController();

  Future<dynamic> _displayDialog(BuildContext context) async {
    // alter the app state to show a dialog
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a task to your list'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Enter todo item'),
          ),
          actions: <Widget>[
            // add button
            TextButton(
              child: const Text('ADD'),
              onPressed: () {
                Navigator.of(context).pop();
                _addNewTodoItem(_textFieldController.text);
                _textFieldController.text = "";
              },
            ),
            // Cancel button
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                _textFieldController.text = "";
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  void _addNewTodoItem(String text) {
    setState(() {
      _todoItems.add(
        TodoItem(id: _todoItems.length + 1, text: text),
      );
    });
  }

  void _removeEntry(int id) {
    setState(() {
      _todoItems.removeWhere((todoItem) => todoItem.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: _todoItems.isEmpty
              ? [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: Text(
                        "No todo entries found!",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ]
              : _todoItems
                  .map(
                    (todoItem) => TodoItemWidget(
                      content: todoItem,
                      removeEntry: _removeEntry,
                    ),
                  )
                  .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(context),
        tooltip: 'Add new todo item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
