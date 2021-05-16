//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String dateTime;
  final bool isDone;
  final Function onCheckboxChanged;

  TaskTile({@required this.title, this.dateTime, this.isDone, this.onCheckboxChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: Color(0xff020202),
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isDone,
        onChanged: onCheckboxChanged,
      ),
      trailing: Text(
        dateTime,
        style: GoogleFonts.poppins(
          color: Color(0xff020202),
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
    onTap: (){},      
    
    );
  }
}