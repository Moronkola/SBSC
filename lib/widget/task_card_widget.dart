import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persist_todoapp/model/task.dart';

/*final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];

class NoteCardWidget extends StatelessWidget {
  NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    final time = DateFormat.yMMMd().format(note.createdTime);
    final minHeight = getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            SizedBox(height: 4),
            Text(
              note.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}*/


class TaskCardWidget extends StatelessWidget {
  TaskCardWidget({
    Key? key,
    required this.task,
    required this.index,
  
  }) : super(key: key);

  final Task task;
  final int index;



  @override
  Widget build(BuildContext context) {
    final time = DateFormat.MMMEd().format(task.createdTime);
    return Card(
      shadowColor: Colors.grey,
      elevation: 10,
        child: ListTile(

                        /*Container(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
                          child: Column(
                            children: <Widget>[
                              //ADD AN ICON HERE INSTEAD
                              Icon(
                                Icons.trip_origin,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),*/
                       /* Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: task.isDone,
        onChanged: onCheckboxChanged,
      )*/
                        title: Text(
                          task.title,
                          style: GoogleFonts.poppins(
                            color: Color(0xff1e2430),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            
                          ),
                        ),
                        trailing: Text(
                          time,
                          style: GoogleFonts.poppins(
                            color: Color(0xff1e2430),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      
                  ), 
                
            
          
        
    );
  }
} 

