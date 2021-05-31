import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:persist_todoapp/db/tasks_database.dart';
import 'package:persist_todoapp/model/task.dart';
import 'package:persist_todoapp/page/edit_task_page.dart';
import 'package:persist_todoapp/page/task_detail_page.dart';
import 'package:persist_todoapp/widget/task_card_widget.dart';

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}
String deadlineDate = Jiffy().format('EEE, do');

class _TasksPageState extends State<TasksPage> {
  late List<Task> tasks = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshTasks();
  }

  @override
  void dispose() {
    TasksDatabase.instance.close();

    super.dispose();
  }

  Future refreshTasks() async {
    setState(() => isLoading = true);

    this.tasks = await TasksDatabase.instance.readAllTasks();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
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
        /*body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : notes.isEmpty
                  ? Text(
                      'No Notes',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )*/
      
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
              child: buildTasks(),
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          elevation: 14,
        backgroundColor: Color(0xff1c222e),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
          tooltip: 'Add Todo',
          child: Icon(
            Icons.add,
            size: 34,),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditTaskPage()),                  
            );
            refreshTasks();
          },
        ),
      );

  //Widget buildTasks() => StaggeredGridView.countBuilder(
        //padding: EdgeInsets.all(8),
        //itemCount: notes.length,
  }
Widget buildTasks() => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 30.0),
        itemCount: tasks.length,   
        itemBuilder: (context, index) {
          final task = tasks[index];
          

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TaskDetailPage(taskId: task.id!),
              ));

              refreshTasks();
            },
            child: TaskCardWidget(task: task, index: index),
          );
        },
      );

}

