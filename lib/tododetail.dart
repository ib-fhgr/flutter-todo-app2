import 'package:flutter/material.dart';
import 'todoitem.dart';

// Detailseite - noch nicht fertig
// Hier könnte das TodoItem im Detail dargestellt werden
// (oder auch verändert werden)
class TodoDetail extends StatelessWidget {
  final TodoItem item;

  const TodoDetail({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo Detail")),
      body: Center(child: Text(item.text)),
    );
  }
}
