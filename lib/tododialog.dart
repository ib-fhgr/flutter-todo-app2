import 'package:flutter/material.dart';
import 'package:todoapp/todoitem.dart';

// Der Dialog ist ein Stateful-Widget weil
// der Bnutzer Änderungen machen kann
class TodoDialog extends StatefulWidget {
  const TodoDialog({super.key});

  @override
  State<TodoDialog> createState() => _TodoDialogState();
}

class _TodoDialogState extends State<TodoDialog> {
  // Feld zur Eingabe von Text
  String eingabe = '';

  // Feld zur Auswahl der Minuten
  int minuten = 15;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          // Textfeld zur Eingabe des Todo-Texts
          TextField(
            onChanged: (value) {
              // Text geändert, speichern
              eingabe = value;
            },
          ),
          // Dropdown zur Auswahl der Minuten
          DropdownButton(
              value: minuten,
              items: const [
                DropdownMenuItem(value: 15, child: Text("15 Minuten")),
                DropdownMenuItem(value: 30, child: Text("30 Minuten")),
                DropdownMenuItem(value: 45, child: Text("45 Minuten")),
              ],
              onChanged: (value) {
                setState(() {
                  // Minuten ausgewählt, speichern
                  minuten = value ?? 0;
                });
              })
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Schliessen ohne speichern
            Navigator.pop(context);
          },
          child: const Text("Abbrechen"),
        ),
        TextButton(
          onPressed: () {
            // Schliessen und neues TodoItem zurückliefert
            var item = TodoItem(text: eingabe, dauer: minuten);
            Navigator.pop(context, item);
          },
          child: const Text("Speichern"),
        ),
      ],
    );
  }
}
