import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:google_fonts/google_fonts.dart';


class AddTaskSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title;
    String dateTime;
    String desc;

    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Create todo",
            style: GoogleFonts.poppins(
              color: Color(0xff030303),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Add a title',
            style: GoogleFonts.poppins(
              color: Color(0xff030303),
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            style: TextStyle(
              fontSize: 18
            ),
            onChanged: (value) {
              title = value;
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff030303),
                  width: 2,
                ),
              ),
            ),
            autofocus: true,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Pick a deadline',
            style: GoogleFonts.poppins(
              color: Color(0xff030303),
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            style: TextStyle(
              fontSize: 18
            ),
            onChanged: (value) {
              dateTime = value;
            },
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              hintText: "ddmmyy  | 00:00",
              hintStyle: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,)                 
            ),
            autofocus: true,
            textAlign: TextAlign.center,    
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Add a description',
            style: GoogleFonts.poppins(
              color: Color(0xff030303),
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            style: TextStyle(
              fontSize: 18
            ),
            onChanged: (value) {
              desc = value;
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xfff3f3f3),
                  width: 5.0,
                ),
              ),
            ),
            autofocus: true,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
           // padding: EdgeInsets.all(16.0),
            //color: Color(0xff030303),
            child: Text(
              "FINISH",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {
              if (title != null && dateTime != null) {
                Provider.of<TaskData>(context, listen: false).addTask(
                  title,
                  dateTime);
                
                Navigator.pop(context);                              
              }
            },
          ),
        ]
      ),
    );
  }
}