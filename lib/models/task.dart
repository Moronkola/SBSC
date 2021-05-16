class Task {
  final String title;
  final String description;
  final String dateTime;
  bool isDone;

  Task({this.title, this.description, this.dateTime, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}