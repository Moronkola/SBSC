import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class TaskFormWidget extends StatelessWidget {
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;  
  
  const TaskFormWidget({
    Key? key,
    this.isImportant = false,
    this.number = 0,
    this.title = '',
    this.description = '',
    required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Create todo",
                        style: GoogleFonts.poppins(
                          color: Color(0xff030303),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),                  
                      Spacer(),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey,
                          ), 
                          onPressed: (){
                            Navigator.pop(context);
                          }
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                 height: 30,
                ),
                Text(
                  'Add a title',
                  style: GoogleFonts.poppins(
                    color: Color(0xff030303),
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start,
                ),
                TextFormField(
                  style: TextStyle(
                    fontSize: 20
                  ),
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff030303),
                        width: 2,
                      ),
                    ),
                  ),
                  autofocus: true,
                  textAlign: TextAlign.start,
                  validator: (title) =>
                    title != null && title.isEmpty ? 'The title cannot be empty' : null,
                  onChanged: onChangedTitle,
                ),
                //SizedBox(
                //  height: 30,
                //),
                Text(
                  'Pick a deadline',
                  style: GoogleFonts.poppins(
                    color: Color(0xff030303),
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start,
                ),
                Container(
                  height: 120,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.dateAndTime,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (DateTime newDateTime) {
                      //deadlineDate = newDateTime.toString();
                      //deadlineDate = Jiffy(newDateTime).format('EEE, do BY HH:mm');
                    },
                    use24hFormat: false,
                    minuteInterval: 1,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Add a description',
                  style: GoogleFonts.poppins(
                    color: Color(0xff030303),
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start,
                ),
                TextFormField(
                  maxLines: 5,                 
                  style: TextStyle(
                  fontSize: 20
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),                      
                    ),
                  ),
                  textAlign: TextAlign.start,
                  validator: (title) => title != null && title.isEmpty
                  ? 'The description cannot be empty'
                  : null,
                  onChanged: onChangedDescription,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
          ),
        );
  }
}

            


