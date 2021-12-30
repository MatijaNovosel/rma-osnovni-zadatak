import 'package:flutter/material.dart';
import 'package:rma_osnovni_zadatak/models/todo_item.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoItem content;
  final Function removeEntry;

  const TodoItemWidget({Key? key, required this.content, required this.removeEntry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              content.text,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: const Icon(Icons.notes),
            iconColor: Colors.blue,
            subtitle: const Text('Added at 29.12.2021.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Remove'),
                onPressed: () => removeEntry(content.id),
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Edit'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
