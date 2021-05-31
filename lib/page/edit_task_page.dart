import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persist_todoapp/db/tasks_database.dart';
import 'package:persist_todoapp/model/task.dart';
import 'package:persist_todoapp/widget/task_form_widget.dart';

class AddEditTaskPage extends StatefulWidget {
  final Task? task;

  const AddEditTaskPage({
    Key? key,
    this.task,
  }) : super(key: key);
  @override
  _AddEditTaskPageState createState() => _AddEditTaskPageState();
}

class _AddEditTaskPageState extends State<AddEditTaskPage> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;
  late String title;
  late String description;
  @override
  void initState() {
    super.initState();

    isImportant = widget.task?.isImportant ?? false;
    number = widget.task?.number ?? 0;
    title = widget.task?.title ?? '';
    description = widget.task?.description ?? '';

  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SingleChildScrollView(
    child: Column(
      children: [
        Form(
          key: _formKey,
          child: TaskFormWidget(
            isImportant: isImportant,
            number: number,
            title: title,
            description: description,
            onChangedImportant: (isImportant) =>
                setState(() => this.isImportant = isImportant),
            onChangedNumber: (number) => setState(() => this.number = number),
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
          ),
        ),
        Container(
          child: buildButton(),
        )
      ]
    ),),
  );
  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Color(0xff1e2430),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
        ),
        onPressed: addOrUpdateTask,
        child: Text(
          'FINISH',
          style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,),
      ),
    ),);
  }

  void addOrUpdateTask() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.task != null;

      if (isUpdating) {
        await updateTask();
      } else {
        await addTask();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateTask() async {
    final task = widget.task!.copy(
      isImportant: isImportant,
      number: number,
      title: title,
      description: description,
    );

    await TasksDatabase.instance.update(task);
  }

  Future addTask() async {
    final task = Task(
      title: title,
      isImportant: true,
      number: number,
      description: description,
      createdTime: DateTime.now(),
    );

    await TasksDatabase.instance.create(task);
  }
}