import 'package:flutter/material.dart';
import 'package:rma_osnovni_zadatak/models/todo_item.dart';
import 'package:intl/intl.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoItem content;
  final VoidCallback onMarkAsDone;

  const TodoItemWidget({
    Key? key,
    required this.content,
    required this.onMarkAsDone,
  }) : super(key: key);

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
            leading: Icon(content.done ? Icons.done_all : Icons.notes),
            iconColor: Colors.blue,
            subtitle: Text(
              'Added at ${DateFormat("dd.MM.yyyy. HH:mm").format(content.createdAt)}',
            ),
          ),
          content.done
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('Mark as done'),
                      onPressed: () => onMarkAsDone(),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
        ],
      ),
    );
  }
}
