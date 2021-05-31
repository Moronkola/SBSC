import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:persist_todoapp/db/tasks_database.dart';
import 'package:persist_todoapp/model/task.dart';
import 'package:persist_todoapp/page/edit_task_page.dart';

class TaskDetailPage extends StatefulWidget {
  final int taskId;

  const TaskDetailPage({
    Key? key,
    required this.taskId,
  }) : super(key: key);

  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  late Task task;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshTask();
  }

  Future refreshTask() async {
    setState(() => isLoading = true);

    this.task = await TasksDatabase.instance.readTask(widget.taskId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1e2430),
          actions: [deleteButton()],
          elevation: 0,
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[               
                    Text(
                      task.title,
                      style: TextStyle(
                        color: Color(0xff1e2430),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    RichText(
                      text: TextSpan(
                        text: 'Date: ',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: DateFormat.MMMEd().format(task.createdTime),
                            style: TextStyle(
                              color: Color(0xff1e2430),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'to be completed',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                      padding: EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        task.description,
                        style: TextStyle(
                          fontSize: 18, 
                          color: Color(0xff1e2430),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                elevation: 14,
                backgroundColor: Color(0xff1e2430),
                foregroundColor: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                tooltip: 'Edit Todo',
                child: Icon(
                  Icons.edit,
                  size: 34,),
                onPressed: () async {
                  if (isLoading) return;
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddEditTaskPage(task: task)),
                  );
                  refreshTask();
                }
              ),
  );

  Widget deleteButton() => IconButton(
        icon: Icon(
          Icons.delete,
          ),
        onPressed: () async {
          await TasksDatabase.instance.delete(widget.taskId);

          Navigator.of(context).pop();
        },
      );
}