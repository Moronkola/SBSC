import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screen/tasks_screen.dart';
import 'package:todo_app/models/task_data.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
