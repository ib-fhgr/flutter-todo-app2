// Datenklasse, um ein TodoItem zu verwalten (Beschriftung, Dauer, Status)
class TodoItem {
  String text;
  bool erledigt;
  int dauer;

  // Konstruktor mit namend-Parametern - text ist Pflichtfeld
  TodoItem({required this.text, this.erledigt = false, this.dauer = 15});

  @override
  String toString() {
    return "$text (erledigt: $erledigt)";
  }
}
