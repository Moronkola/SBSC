import 'package:intl/intl.dart';

final String tableTasks = 'tasks';

class TaskFields {
  static final List<String> values = [
    /// Add all fields
    id, isImportant, number, title, description, time,  
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
}

class Task {
   final int? id;
   final bool isImportant;
   final int number;
   final String title;
   final String description;
   final DateTime createdTime;

 Task({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,      
  });

   Task copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,


  }) =>
      Task(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Task fromJson(Map<String, Object?> json) => Task(
        id: json[TaskFields.id] as int?,
        isImportant: json[TaskFields.isImportant] == 1,
        number: json[TaskFields.number] as int,
        title: json[TaskFields.title] as String,
        description: json[TaskFields.description] as String,
        createdTime: DateTime.parse(json[TaskFields.time] as String),

        
      );

  Map<String, Object?> toJson() => {
        TaskFields.id: id,
        TaskFields.title: title,
        TaskFields.isImportant: isImportant ? 1 : 0,
        TaskFields.number: number,
        TaskFields.description: description,
        TaskFields.time: createdTime.toIso8601String(),
      };
}