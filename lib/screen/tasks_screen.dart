import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/components/add_task_sheet.dart';
import 'package:todo_app/components/tasks_list.dart';


class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Media query helps us get the device SIZE (height, width) property
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff1e2430),
      appBar: AppBar(
        backgroundColor: Color(0xff1e2430),
        title: Padding(
          padding: const EdgeInsets.symmetric(),
          child: Text(
            'My todos',
            style: GoogleFonts.poppins(
            fontSize: 18,
            color: Color(0xffffffff),
            fontWeight: FontWeight.w500),            
          ),
        ),
      
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 90, 90),
          child: Icon(
            Icons.drag_handle_rounded,
            size: 40,    
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.settings
            ),
          ),
        ]
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child:  Text(
                            'Welcome back, 007',
                            style: GoogleFonts.poppins(    
                            fontSize: 18,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w500),            
                  ),    
              ),
            ]
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
            height: size.height / 4,
            width: size.width / 1.115,
            color: Color(0xff9c9d99),
            //Stack widget stacks widgets on top of each other
            child: Stack(
              children: [
                // first child of the stack
                Container(                                    
                  decoration: BoxDecoration(                     
                    image: DecorationImage(
                      fit: BoxFit.cover,                     
                      image: NetworkImage(
                          "https://i.pinimg.com/474x/6b/23/5f/6b235faf1e02a49477a4210cf2f0bfd2.jpg"                      
                      ),
                    ),
                  ),
                ),
              ]  
            )
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 14,
        backgroundColor: Color(0xff1c222e),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        onPressed: () {
          // clear the controller value as soon as you tap on the FAB          
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskSheet(),
            ),
            isScrollControlled: true,
          );
        },
        tooltip: 'Add Todo',
        child: Icon(
          Icons.add,
          size: 34,
        ),        
      ),
    );
  }            
}