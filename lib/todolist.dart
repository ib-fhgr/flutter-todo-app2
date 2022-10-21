import 'package:flutter/material.dart';
import 'package:todoapp/tododetail.dart';
import 'tododialog.dart';
import 'todoitem.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // unsere Testdaten - hier müsste man später eine Datenbank o. ä. verwenden
  List<TodoItem> liste = [
    TodoItem(text: "Einkaufen", erledigt: false),
    TodoItem(text: "Velo reparieren", erledigt: false),
    TodoItem(text: "Buch bestellen", erledigt: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todoliste"),
        actions: [
          IconButton(
            onPressed: () async {
              // Dialog zum Erstellen eines Todoitems aufrufen
              var ergebnis = await showDialog<TodoItem?>(
                context: context,
                builder: (context) {
                  return const TodoDialog();
                },
              );

              setState(() {
                // falls der Benutzer ein Item angelegt hat
                // dann item in die Liste und neu zeichnen
                if (ergebnis != null) liste.add(ergebnis);
              });
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: liste.length,
        itemBuilder: (context, index) {
          // für jedes TodoItem ein ListTile erzeugen
          TodoItem todoitem = liste[index];

          return ListTile(
            onTap: () {
              // Detailseite aufrufen und angeglicktes item übergeben
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TodoDetail(item: todoitem),
              ));
            },
            textColor: todoitem.erledigt ? Colors.grey : Colors.black,
            title: Text(todoitem.text),
            subtitle: Text("${todoitem.dauer} Minuten"),
            trailing: Checkbox(
              value: todoitem.erledigt,
              onChanged: (value) {
                setState(() {
                  // Abhaken des TodoItems, und neu zeichnen
                  todoitem.erledigt = value ?? false;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
